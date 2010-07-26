class DealUser < ActiveRecord::Base
  belongs_to :deal
  belongs_to :user

  insta_search
end
