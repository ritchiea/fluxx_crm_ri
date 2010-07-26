class CreateDealOrganizations < ActiveRecord::Migration
  def self.up
    create_table :deal_organizations do |t|
    
      t.timestamps
      t.integer :deal_id, :organization_id, :null => true, :limit => 12
    end
    add_index :deal_organizations, [:organization_id, :deal_id]
    execute "alter table deal_organizations add constraint deal_organizations_org_id foreign key (organization_id) references organizations(id)" unless connection.adapter_name =~ /SQLite/i
    execute "alter table deal_organizations add constraint deal_organizations_deal_id foreign key (deal_id) references deals(id)" unless connection.adapter_name =~ /SQLite/i
  end

  def self.down
    drop_table :deal_organizations
  end
end
