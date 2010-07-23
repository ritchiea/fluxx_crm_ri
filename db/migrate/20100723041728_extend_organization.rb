class ExtendOrganization < ActiveRecord::Migration
  def self.up
    add_column :organizations, :num_employees, :integer
    add_column :organizations, :num_grants, :integer
    add_column :organizations, :assets, :integer
    add_column :organizations, :annual_revenue, :integer
    
    software_group = MultiElementGroup.create :name => 'software_types', :description => 'Software', :target_class_name => 'Organization'
    MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'Gifts'
    MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'Filemaker'
    MultiElementValue.create :multi_element_group_id => software_group.id, :value => 'Excel'
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
