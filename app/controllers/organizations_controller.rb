class OrganizationsController < ApplicationController
  include FluxxOrganizationsController
  insta_index Organization do |insta|
    insta.pre do |conf, controller|
      p "ESH: have params=#{controller.params.inspect}"
    end
  end
end