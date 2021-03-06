ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require File.join(File.dirname(__FILE__), 'blueprint')
require 'rails/test_help'

class TestHelper
  def self.loaded_meg= val
    @loaded_meg = val
  end
  
  def self.loaded_meg
    @loaded_meg
  end
  
end




class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def setup_fixtures
    unless TestHelper.loaded_meg
      TestHelper.loaded_meg = true
      setup_multi_element_groups
    end
    super
  end

  setup :clear_out_blueprint_attributes

  def clear_out_blueprint_attributes
    @entered = {} unless @entered
    unless @entered["#{self.class.name}::#{@method_name}"]
      @entered["#{self.class.name}::#{@method_name}"] = true

      # It's possible to run out of faker values (such as last name), so if you don't reset your shams you could run out of unique values
      Sham.reset
    end
  end
end

class ActionController::TestCase
  include Devise::TestHelpers
end



# Swap out the thinking sphinx sphinx interface with actual SQL
module ThinkingSphinx
  module SearchMethods
    module ClassMethods
      
      def search_for_ids(*args)
        paged_objects = search *args
        raw_ids = paged_objects.map &:id
        WillPaginate::Collection.create paged_objects.current_page, paged_objects.per_page, paged_objects.total_pages do |pager|
          pager.replace raw_ids
        end
      end
      
      def search(*args)
        self.paginate(:page => 1)
      end
    end
  end
end