class Deal < ActiveRecord::Base
  belongs_to :updated_by, :class_name => 'User', :foreign_key => 'updated_by_id'
  belongs_to :main_contact, :class_name => 'User', :foreign_key => 'main_contact_id'
  belongs_to :decision_maker, :class_name => 'User', :foreign_key => 'decision_maker_id'
  belongs_to :sales_lead, :class_name => 'User', :foreign_key => 'sales_lead_id'
  
  SEARCH_ATTRIBUTES = [:description]
  
  define_index do
    # fields
    indexes description, :sortable => true
    t.string :description
    t.integer :proposed_amount, :limit => 12
    t.integer :contract_amount, :limit => 12

    # attributes
    has created_at, updated_at, deleted_at, state

    set_property :delta => true
  end

  insta_realtime do |insta|
    insta.delta_attributes = SEARCH_ATTRIBUTES
    insta.updated_by_field = :updated_by_id
  end
  insta_search do |insta|
    insta.filter_fields = SEARCH_ATTRIBUTES
  end
  
  include AASM

  aasm_column :state
  aasm_initial_state :new
  
  aasm_state :new
  aasm_state :closed
  
  aasm_event :close do
    transitions :from => :new, :to => :closed
  end
  
  
  insta_workflow
end
