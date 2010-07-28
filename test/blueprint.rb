require 'machinist/active_record'
require 'sham'

require 'faker'

ATTRIBUTES = {}

def bp_attrs
  ATTRIBUTES
end

# For faker formats see http://faker.rubyforge.org/rdoc/

Sham.document { Tempfile.new('the attached document') }
Sham.word { Faker::Lorem.words(2).join '' }
Sham.words { Faker::Lorem.words(3).join ' ' }
Sham.sentence { Faker::Lorem.sentence }
Sham.company_name { Faker::Company.name }
Sham.first_name { Faker::Name.first_name }
Sham.last_name { Faker::Name.last_name }
Sham.login { Faker::Internet.user_name }
Sham.email { Faker::Internet.email }
Sham.url { "http://#{Faker::Internet.domain_name}/#{Faker::Lorem.words(1).first}"  }

User.blueprint do
  first_name Sham.first_name
  last_name Sham.last_name
  login Sham.login
  email Sham.email
  created_at 5.days.ago.to_s(:db)
  state 'active'
end


Organization.blueprint do
  name Sham.company_name
  city Sham.words
  street_address Sham.words
  street_address2 Sham.words
  url Sham.url
end

Deal.blueprint do
  description Sham.sentence
end

DealOrganization.blueprint do
end

DealUser.blueprint do
end

def setup_multi_element_groups
  unless bp_attrs[:executed_setup_multi_element_groups]
    bp_attrs[:executed_setup_multi_element_groups] = true
    MultiElementValue.delete_all
    MultiElementGroup.delete_all
    bp_attrs[:software_group] = MultiElementGroup.create :name => 'software_types', :description => 'Software', :target_class_name => 'Organization'
    MultiElementValue.create :multi_element_group_id => bp_attrs[:software_group].id, :value => 'Altum EasyGrants'
    MultiElementValue.create :multi_element_group_id => bp_attrs[:software_group].id, :value => 'Altum proposalCENTRAL'
    MultiElementValue.create :multi_element_group_id => bp_attrs[:software_group].id, :value => 'Bromelkamp Pearl (First Pearl, Corporate Pearl, Community Pearl)'
    bp_attrs[:category_group] = MultiElementGroup.create :name => 'deal_categories', :description => 'Deal Categories', :target_class_name => 'Deal'
    MultiElementValue.create :multi_element_group_id => bp_attrs[:category_group].id, :value => 'Red'
    MultiElementValue.create :multi_element_group_id => bp_attrs[:category_group].id, :value => 'Yellow'
    MultiElementValue.create :multi_element_group_id => bp_attrs[:category_group].id, :value => 'Green'
    MultiElementValue.create :multi_element_group_id => bp_attrs[:category_group].id, :value => 'Brown'
    Deal.add_multi_elements
    Organization.add_multi_elements
  end
end