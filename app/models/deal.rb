class Deal < ActiveRecord::Base
  belongs_to :updated_by, :class_name => 'User', :foreign_key => 'updated_by_id'
  belongs_to :main_contact, :class_name => 'User', :foreign_key => 'main_contact_id'
  belongs_to :decision_maker, :class_name => 'User', :foreign_key => 'decision_maker_id'
  belongs_to :sales_lead, :class_name => 'User', :foreign_key => 'sales_lead_id'
  
  has_many :deal_users
  has_many :users, :through => :deal_users
  has_many :deal_organizations
  has_many :organizations, :through => :deal_organizations
  has_many :favorites, :as => :favorable
  has_many :model_documents, :as => :documentable
  has_many :notes, :as => :notable
  has_many :group_members, :as => :groupable
  
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

  insta_workflow
  insta_multi
  insta_realtime do |insta|
    insta.delta_attributes = SEARCH_ATTRIBUTES
    insta.updated_by_field = :updated_by_id
  end
  insta_search do |insta|
    insta.filter_fields = SEARCH_ATTRIBUTES
  end
  insta_workflow do |insta|
    insta.states_to_english = {
      :new => 'New', :contacted => 'Contacted', :qualified => 'Qualified', :negotiating => 'Negotiating', :lost => 'Lost', :won => 'Won', :backburnered => 'Backburnered', :not_interested => 'Not Interested'
    }
    insta.events_to_english = {
      :contact => "Contact", :qualify => 'Qualify', :start_negotiations => 'Start Negotiations', :lose => 'Lose', :win => 'Win', :backburnered => 'Backburner', :reopen => "Reopen"
    }
  end


  include AASM

  aasm_column :state
  aasm_initial_state :new
  
  aasm_state :new
  aasm_state :contacted
  aasm_state :qualified
  aasm_state :negotiating
  aasm_state :lost
  aasm_state :won
  aasm_state :backburnered
  aasm_state :not_interested
  
  DEAL_CHAIN_STATES = [:new, :contacted, :qualified, :negotiating]
  TERMINAL_STATES = [:lost, :won, :backburnered, :not_interested]
  
  def self.deal_chain_states
    DEAL_CHAIN_STATES
  end
  
  aasm_event :contact do
    transitions :from => :new, :to => :contacted
  end
  
  aasm_event :qualify do
    transitions :from => :contacted, :to => :qualified
  end
  
  aasm_event :start_negotiations do
    transitions :from => :qualified, :to => :negotiating
  end

  aasm_event :lose do
    transitions :from => DEAL_CHAIN_STATES, :to => :lost
  end

  aasm_event :win do
    transitions :from => :negotiating, :to => :won
  end
  
  aasm_event :backburner do
    transitions :from => :negotiating, :to => :backburnered
  end
  
  aasm_event :reopen do
    transitions :from => TERMINAL_STATES, :to => :new
  end
end