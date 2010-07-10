# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100710052914) do

  create_table "client_stores", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "name"
    t.datetime "deleted_at"
    t.text     "data",       :limit => 2147483647
  end

  add_index "client_stores", ["user_id"], :name => "index_client_stores_on_user_id"

  create_table "favorites", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "favorable_type", :null => false
    t.integer  "favorable_id",   :null => false
  end

  add_index "favorites", ["user_id"], :name => "favorites_user_id"

  create_table "geo_cities", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",           :limit => 150, :null => false
    t.integer  "geo_state_id"
    t.integer  "geo_country_id"
    t.string   "postalCode",     :limit => 150
    t.string   "latitude",       :limit => 150
    t.string   "longitude",      :limit => 150
    t.string   "metro_code",     :limit => 150
    t.string   "area_code",      :limit => 150
    t.integer  "orginal_loc_id",                :null => false
  end

  add_index "geo_cities", ["geo_country_id"], :name => "geo_cities_country_id"
  add_index "geo_cities", ["geo_state_id"], :name => "geo_cities_state_id"
  add_index "geo_cities", ["name"], :name => "geo_cities_name_index"

  create_table "geo_countries", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                 :limit => 90, :null => false
    t.string   "fips104",              :limit => 90
    t.string   "iso2",                 :limit => 90
    t.string   "iso3",                 :limit => 90
    t.string   "ison",                 :limit => 90
    t.string   "internet",             :limit => 90
    t.string   "capital",              :limit => 90
    t.string   "map_reference",        :limit => 90
    t.string   "nationality_singular", :limit => 90
    t.string   "nationality_plural",   :limit => 90
    t.string   "currency",             :limit => 90
    t.string   "currency_code",        :limit => 90
    t.string   "population",           :limit => 90
    t.string   "title",                :limit => 90
    t.text     "comment"
  end

  add_index "geo_countries", ["iso2"], :name => "country_iso2_index"
  add_index "geo_countries", ["name"], :name => "country_name_index"

  create_table "geo_states", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",           :limit => 90, :null => false
    t.string   "fips_10_4",      :limit => 90, :null => false
    t.string   "abbreviation",   :limit => 25
    t.integer  "geo_country_id",               :null => false
  end

  add_index "geo_states", ["abbreviation"], :name => "geo_states_abbrv_index"
  add_index "geo_states", ["geo_country_id"], :name => "geo_states_country_id"
  add_index "geo_states", ["name"], :name => "geo_states_name_index"

  create_table "model_documents", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.string   "documentable_type",     :null => false
    t.integer  "documentable_id",       :null => false
  end

  create_table "multi_element_choices", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "target_id",              :null => false
    t.integer  "multi_element_value_id", :null => false
  end

  add_index "multi_element_choices", ["multi_element_value_id"], :name => "multi_element_choice_value_id"
  add_index "multi_element_choices", ["target_id", "multi_element_value_id"], :name => "multi_element_choices_index_cl_attr_val", :unique => true

  create_table "multi_element_groups", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "target_class_name", :null => false
    t.string   "name"
    t.string   "description"
  end

  create_table "multi_element_values", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.string   "value"
    t.integer  "multi_element_group_id"
  end

  add_index "multi_element_values", ["multi_element_group_id"], :name => "index_multi_element_values_on_multi_element_group_id"

  create_table "notes", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.text     "note",                            :null => false
    t.string   "notable_type",                    :null => false
    t.integer  "notable_id",                      :null => false
    t.boolean  "delta",         :default => true
    t.datetime "deleted_at"
  end

  add_index "notes", ["created_by_id"], :name => "notes_created_by_id"
  add_index "notes", ["updated_by_id"], :name => "notes_updated_by_id"

  create_table "organizations", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.string   "name",            :limit => 1000,                    :null => false
    t.string   "street_address"
    t.string   "street_address2"
    t.string   "city",            :limit => 100
    t.integer  "geo_state_id"
    t.integer  "geo_country_id"
    t.string   "postal_code",     :limit => 100
    t.string   "phone",           :limit => 100
    t.string   "other_contact",   :limit => 100
    t.string   "fax",             :limit => 100
    t.string   "email",           :limit => 100
    t.string   "url",             :limit => 2048
    t.string   "blog_url",        :limit => 2048
    t.string   "twitter_url",     :limit => 2048
    t.string   "acronym",         :limit => 100
    t.string   "state",                           :default => "new"
    t.boolean  "delta",                           :default => true
    t.datetime "deleted_at"
    t.integer  "parent_org_id"
  end

  add_index "organizations", ["created_by_id"], :name => "organizations_created_by_id"
  add_index "organizations", ["geo_country_id"], :name => "organizations_geo_country_id"
  add_index "organizations", ["geo_state_id"], :name => "organizations_geo_state_id"
  add_index "organizations", ["name"], :name => "index_organizations_on_name", :length => {"name"=>"767"}
  add_index "organizations", ["parent_org_id"], :name => "index_organizations_on_parent_org_id"
  add_index "organizations", ["updated_by_id"], :name => "organizations_updated_by_id"

  create_table "realtime_updates", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "action",           :null => false
    t.integer  "user_id"
    t.integer  "model_id",         :null => false
    t.string   "type_name",        :null => false
    t.string   "model_class",      :null => false
    t.text     "delta_attributes", :null => false
  end

  create_table "user_organizations", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.integer  "user_id"
    t.integer  "organization_id"
    t.string   "title",           :limit => 400
    t.string   "department",      :limit => 400
    t.string   "email",           :limit => 400
    t.string   "phone",           :limit => 400
    t.datetime "deleted_at"
  end

  add_index "user_organizations", ["created_by_id"], :name => "user_organizations_created_by_id"
  add_index "user_organizations", ["organization_id"], :name => "user_org_org_id"
  add_index "user_organizations", ["updated_by_id"], :name => "user_organizations_updated_by_id"
  add_index "user_organizations", ["user_id"], :name => "user_org_user_id"

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.string   "login",                        :limit => 40
    t.string   "first_name",                   :limit => 400,  :default => ""
    t.string   "last_name",                    :limit => 400,  :default => ""
    t.string   "email",                        :limit => 400
    t.string   "personal_email",               :limit => 400
    t.string   "salutation",                   :limit => 400
    t.string   "prefix",                       :limit => 400
    t.string   "middle_initial",               :limit => 400
    t.string   "personal_phone",               :limit => 400
    t.string   "personal_mobile",              :limit => 400
    t.string   "personal_fax",                 :limit => 400
    t.string   "personal_street_address",      :limit => 400
    t.string   "personal_street_address2",     :limit => 400
    t.string   "personal_city",                :limit => 400
    t.integer  "personal_geo_state_id"
    t.integer  "personal_geo_country_id"
    t.string   "personal_postal_code",         :limit => 400
    t.string   "work_phone",                   :limit => 400
    t.string   "work_fax",                     :limit => 400
    t.string   "other_contact",                :limit => 400
    t.string   "assistant_name",               :limit => 400
    t.string   "assistant_phone",              :limit => 400
    t.string   "assistant_email",              :limit => 400
    t.string   "blog_url",                     :limit => 2048
    t.string   "twitter_url",                  :limit => 2048
    t.datetime "birth_at"
    t.string   "state",                                        :default => "passive"
    t.boolean  "delta",                                        :default => true
    t.datetime "deleted_at"
    t.string   "user_salutation",              :limit => 40
    t.integer  "primary_user_organization_id"
    t.datetime "last_logged_in_at"
    t.string   "time_zone",                    :limit => 40,   :default => "Pacific Time (US & Canada)"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["personal_geo_country_id"], :name => "users_personal_country_id"
  add_index "users", ["personal_geo_state_id"], :name => "users_personal_geo_state_id"
  add_index "users", ["primary_user_organization_id"], :name => "users_primary_user_org_id"

end
