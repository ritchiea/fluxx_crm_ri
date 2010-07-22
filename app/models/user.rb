class User < ActiveRecord::Base
  include ::FluxxUser

  define_index do
    # fields
    indexes first_name, last_name, :sortable => true

    # attributes
    has created_at, updated_at, deleted_at

    set_property :delta => true
  end
end