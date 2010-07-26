class DealUsersController < ApplicationController
  insta_index DealUser do |insta|
    insta.template = 'deal_user_list'
  end
  insta_show DealUser do |insta|
    insta.template = 'deal_user_show'
    insta.add_workflow
  end
  insta_new DealUser do |insta|
    insta.template = 'deal_user_form'
  end
  insta_post DealUser do |insta|
    insta.template = 'deal_user_form'
  end
  insta_delete DealUser do |insta|
    insta.template = 'deal_user_form'
  end
end
