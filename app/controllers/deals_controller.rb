class DealsController < ApplicationController
  insta_index Deal do |insta|
    insta.template = 'deal_list'
  end
  insta_show Deal do |insta|
    insta.template = 'deal_show'
    insta.add_workflow
  end
  insta_new Deal do |insta|
    insta.template = 'deal_form'
  end
  insta_edit Deal do |insta|
    insta.template = 'deal_form'
  end
  insta_post Deal do |insta|
    insta.template = 'deal_form'
  end
  insta_put Deal do |insta|
    insta.template = 'deal_form'
    insta.add_workflow
  end
  insta_delete Deal do |insta|
    insta.template = 'deal_form'
  end
end
