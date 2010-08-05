class ExtendOrganization < ActiveRecord::Migration
  def self.up
    add_column :organizations, :num_employees, :integer
    add_column :organizations, :num_grants, :integer
    add_column :organizations, :assets, :integer
    add_column :organizations, :annual_revenue, :integer
  end

  def self.down
    remove_column :organizations, :num_employees
    remove_column :organizations, :num_grants
    remove_column :organizations, :assets
    remove_column :organizations, :annual_revenue
  end
end
