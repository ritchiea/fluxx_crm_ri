class CreateDeals < ActiveRecord::Migration
  def self.up
    create_table :deals do |t|
      t.timestamps
      t.integer :created_by_id, :updated_by_id, :organization_id, :null => true, :limit => 12
      t.string :description
      t.integer :proposed_amount, :limit => 12
      t.integer :contract_amount, :limit => 12
      t.string :state
      t.datetime :deleted_at, :null => true
      t.boolean :delta,       :null => :false, :default => true
    end
  end

  def self.down
    drop_table :deals
  end
end
