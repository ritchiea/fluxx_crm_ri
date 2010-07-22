class Organization < ActiveRecord::Base
  include ::FluxxOrganization

  define_index do
    # fields
    indexes name, :sortable => true

    # attributes
    has created_at, updated_at, deleted_at, state, parent_org_id
    has users(:id), :as => :user_ids
    has group_members.group(:id), :type => :multi, :as => :group_ids
    has favorites.user(:id), :as => :favorite_user_ids

    set_property :delta => true
  end
end

