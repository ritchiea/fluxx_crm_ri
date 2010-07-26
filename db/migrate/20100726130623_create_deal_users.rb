class CreateDealUsers < ActiveRecord::Migration
  def self.up
    create_table :deal_users do |t|
      t.timestamps
      t.integer :user_id, :deal_id, :null => true, :limit => 12
    end
    add_index :deal_users, [:user_id, :deal_id]
    execute "alter table deal_users add constraint deal_users_user_id foreign key (user_id) references users(id)" unless connection.adapter_name =~ /SQLite/i
    execute "alter table deal_users add constraint deal_users_deal_id foreign key (deal_id) references deals(id)" unless connection.adapter_name =~ /SQLite/i
  end

  def self.down
    drop_table :deal_users
  end
end
