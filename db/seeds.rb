# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

group = Group.create :name => 'Northern'
group = Group.create :name => 'Southern'
group = Group.create :name => 'Western'
group = Group.create :name => 'Eastern'

software_group = MultiElementGroup.create :name => 'software_types', :description => 'Software', :target_class_name => 'Organization'
MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'Altum EasyGrants'
MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'Altum proposalCENTRAL'
MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'Bromelkamp Pearl (First Pearl, Corporate Pearl, Community Pearl)'
MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'CloserWare Grantmaker'
MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'CyberGrants'
MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'Dulles Technology Partners WebGrants'
MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'Grantium'
MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'Foundant Technologies Grant Lifecycle Manager (GLM)'
MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'Foundation Source'
MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'Fusion Labs GrantedGE'
MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'JK Group Grants Management'
MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'MicroEdge GIFTS'
MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'MicroEdge FIMS'
MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'MicroEdge FoundationPower'
MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'NPower Foundation Grants Manager'
MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'PhilanTech PhilanTrack'
MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'Salesforce'
MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'Stellar Technology Solutions iphi Core'
MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'Other commercial'
MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'Custom developed in-house'
MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'None at this time'
MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'Planned within the next 18 months'

category_group = MultiElementGroup.create :name => 'deal_categories', :description => 'Deal Categories', :target_class_name => 'Deal'
MultiElementValue.create :multi_element_group_id => category_group.id, :value => 'Red'
MultiElementValue.create :multi_element_group_id => category_group.id, :value => 'Yellow'
MultiElementValue.create :multi_element_group_id => category_group.id, :value => 'Green'
MultiElementValue.create :multi_element_group_id => category_group.id, :value => 'Brown'