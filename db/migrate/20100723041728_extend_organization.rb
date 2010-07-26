class ExtendOrganization < ActiveRecord::Migration
  def self.up
    add_column :organizations, :num_employees, :integer
    add_column :organizations, :num_grants, :integer
    add_column :organizations, :assets, :integer
    add_column :organizations, :annual_revenue, :integer
    
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
  end

  def self.down
    remove_column :organizations, :num_employees
    remove_column :organizations, :num_grants
    remove_column :organizations, :assets
    remove_column :organizations, :annual_revenue
    group = MultiElementGroup.where(:name => 'software_types').first
    MultiElementValue.delete_all :multi_element_group_id => group.id
    group.destroy
  end
end
