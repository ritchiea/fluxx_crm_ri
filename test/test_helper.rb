ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require File.join(File.dirname(__FILE__), 'blueprint')
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
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