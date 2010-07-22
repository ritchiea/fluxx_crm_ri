class Deal < ActiveRecord::Base
  include AASM

  aasm_column :state
  aasm_initial_state :new
  
end
