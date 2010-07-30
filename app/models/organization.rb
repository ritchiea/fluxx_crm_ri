class Organization < ActiveRecord::Base
  include ::FluxxOrganization
  has_many :deal_organizations
  has_many :deals, :through => :deal_organizations

  insta_search do |insta|
    insta.filter_fields = [:state, :created_at, :updated_at, :name, :id, :software_type_ids]
  end
  
  define_index do
    # fields
    indexes name, :sortable => true

    # attributes
    has created_at, updated_at, deleted_at, state, parent_org_id
    has users(:id), :as => :user_ids
    has group_members.group(:id), :type => :multi, :as => :group_ids
    has favorites.user(:id), :as => :favorite_user_ids
    has software_types(:id), :as => :software_type_ids

    set_property :delta => true
  end
end

