class DealOrganizationsController < ApplicationController
  insta_index DealOrganization do |insta|
    insta.template = 'deal_organization_list'
  end
  insta_show DealOrganization do |insta|
    insta.template = 'deal_organization_show'
    insta.add_workflow
  end
  insta_new DealOrganization do |insta|
    insta.template = 'deal_organization_form'
  end
  insta_post DealOrganization do |insta|
    insta.template = 'deal_organization_form'
  end
  insta_delete DealOrganization do |insta|
    insta.template = 'deal_organization_form'
  end
end
