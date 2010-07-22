class Organization < ActiveRecord::Base
  include ::FluxxOrganization

  define_index do
    # fields
    indexes name, :sortable => true

    # attributes
    has created_at, updated_at, deleted_at, state, parent_org_id

    set_property :delta => true
  end
end

