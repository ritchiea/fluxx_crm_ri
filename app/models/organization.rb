class Organization < ActiveRecord::Base
  include ::FLuxxOrganization

  define_index do
    # fields
    indexes name, :sortable => true

    # attributes
    has created_at, updated_at, deleted_at, state, parent_org_id
  end
end

