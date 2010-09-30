class OrganizationsController < ApplicationController
  include FluxxOrganizationsController
  
  insta_index Organization do |insta|
    insta.filter_title = "Organizations Filter"
    insta.filter_template = 'organizations/organization_filter'
  end
  
  insta_related Organization do |insta|
    insta.add_related do |related|
      related.display_name = 'People'
      related.for_search do |model|
        model.related_users
      end
      related.display_template = '/users/related_users'
    end
  end
  
end