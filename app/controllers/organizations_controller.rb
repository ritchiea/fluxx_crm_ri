class OrganizationsController < ApplicationController
  include FluxxOrganizationsController
  
  base.insta_index Organization do |insta|
    insta.filter_title = "Organizations Filter"
    insta.filter_template = 'organizations/organization_filter'
  end
end