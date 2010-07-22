class User < ActiveRecord::Base
  include ::FluxxUser

  define_index do
    # fields
    indexes first_name, last_name, :sortable => true

    # attributes
    has created_at, updated_at, deleted_at
    has favorites.user(:id), :as => :favorite_user_ids
    has user_organizations.organization(:id), :as => :organization_id
    has group_members.group(:id), :type => :multi, :as => :group_ids

    set_property :delta => true
  end
end