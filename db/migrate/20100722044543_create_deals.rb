class CreateDeals < ActiveRecord::Migration
  def self.up
    create_table :deals do |t|
      t.timestamps
      t.integer :created_by_id, :updated_by_id, :organization_id, :null => true, :limit => 12
      t.text :description
      t.integer :estimated_amount, :limit => 12
      t.integer :final_amount, :limit => 12
      t.integer :probability
      t.integer :main_contact_id, :decision_maker_id, :sales_lead_id, :null => true, :limit => 12
      t.datetime :final_proposal_at
      t.integer :category_id, :null => true, :limit => 12
      t.string :state
      t.datetime :deleted_at, :null => true
      t.boolean :delta,       :null => :false, :default => true
    end
    
    category_group = MultiElementGroup.create :name => 'deal_categories', :description => 'Deal Categories', :target_class_name => 'Deal'
    MultiElementValue.create :multi_element_group_id => category_group.id, :value => 'Red'
    MultiElementValue.create :multi_element_group_id => category_group.id, :value => 'Yellow'
    MultiElementValue.create :multi_element_group_id => category_group.id, :value => 'Green'
    MultiElementValue.create :multi_element_group_id => category_group.id, :value => 'Brown'
    
    execute "alter table deals add constraint deals_categories foreign key (category_id) references multi_element_values(id)" unless connection.adapter_name =~ /SQLite/i
  end

  def self.down
    drop_table :deals
    group = MultiElementGroup.where(:name => 'deal_categories').first
    MultiElementValue.delete_all :multi_element_group_id => group.id
    group.destroy
  end
end
