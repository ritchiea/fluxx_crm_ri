require 'machinist/active_record'
require 'sham'

require 'faker'

ATTRIBUTES = {}

def bp_attrs
  ATTRIBUTES
end

# For faker formats see http://faker.rubyforge.org/rdoc/

Sham.document { Tempfile.new('the attached document') }
Sham.word { Faker::Lorem.words(2).join '' }
Sham.words { Faker::Lorem.words(3).join ' ' }
Sham.sentence { Faker::Lorem.sentence }
Sham.company_name { Faker::Company.name }
Sham.first_name { Faker::Name.first_name }
Sham.last_name { Faker::Name.last_name }
Sham.login { Faker::Internet.user_name }
Sham.email { Faker::Internet.email }
Sham.url { "http://#{Faker::Internet.domain_name}/#{Faker::Lorem.words(1).first}"  }

User.blueprint do
  first_name Sham.first_name
  last_name Sham.last_name
  login Sham.login
  email Sham.email
  created_at 5.days.ago.to_s(:db)
  state 'active'
end


Organization.blueprint do
  name Sham.company_name
  city Sham.words
  street_address Sham.words
  street_address2 Sham.words
  url Sham.url
end