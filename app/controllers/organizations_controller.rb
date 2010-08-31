class OrganizationsController < ApplicationController
  include FluxxOrganizationsController
  
  base.insta_index Organization do |insta|
    insta.filter_title = "Organizations Filter"
    insta.filter_template = 'organizations/organization_filter'
  end
  
  base.insta_related Organization do |insta|
    insta.add_related do |related|
      related.display_name = 'People'
      related.related_class = User
      related.search_id = :organization_id
      related.extra_condition = {:deleted_at => 0}
      related.max_results = 20
      related.order = 'last_name asc, first_name asc'
      related.display_template = '/users/related_users'
    end
  end
  
end