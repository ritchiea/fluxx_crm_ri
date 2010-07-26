class DealOrganization < ActiveRecord::Base
  belongs_to :deal
  belongs_to :organization

  insta_search
end
