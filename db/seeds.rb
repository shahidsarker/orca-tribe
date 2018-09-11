# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# >>>>>>>>> REQUIREMENTS TO CREATE A USER <<<<<<<<<<<<<<
# t.string "email", default: "", null: false
# t.string "encrypted_password", default: "", null: false
# t.string "first_name", default: "", null: false
# t.string "last_name", default: "", null: false
# t.string "location", default: "", null: false
# t.string "avatar", default: "", null: false
# t.text "bio", default: "", null: false

# imani: >>>>>>>>> BLANK USER TEMPLATE<<<<<<<<<<<<<<
# imani: note that when created a new user encrypted_password: should be change to password:.It will encryt once seeded.

# User.create(
#     email: '',
#     encrypted_password: '',
#     first_name: '',
#     last_name: '',
#     location: '',
#     avatar: '',
#     bio: ''
# )

User.create(
    email: 'asimone@gmail.com',
    password: 'password',
    first_name: 'Ashley',
    last_name: 'Simone',
    location: 'Brooklyn',
    avatar: '/assets/default_user.png',
    bio: 'We must stand up, move the needle emerging do-gooder entrepreneur movements. Co-creation overcome injustice collaborative consumption theory of change the design thinking. Inclusion, thought provoking activate shine white paper. Segmentation empower communities a save the world framework vibrant inspire.'
)

User.create(
    email: 'dpatlut@gmail.com',
    password: 'password',
    first_name: 'David',
    last_name: 'Patlut',
    location: 'Brooklyn',
    avatar: '/assets/default_user.png',
    bio: 'Thought provoking NGO venture philanthropy; natural resources state of play compelling shared unit of analysis move the needle support. Change-makers deep dive, theory of change program areas impact fairness but collaborative consumption.'
)


User.create(
    email: 'jmurphy@gmail.com',
    password: 'password',
    first_name: 'John',
    last_name: 'Murphy',
    location: 'Queens',
    avatar: '/assets/default_user.png',
    bio: 'The, mass incarceration citizen-centered shared value shine justice; living a fully ethical life energize LGBTQ+. The, replicable commitment citizen-centered, scalable. Do-gooder, shared unit of analysis cultivate indicators compelling her body her rights compassion.'
)

require 'httparty'

NYCSERV_KEY = ENV['NYCSERV_KEY']
NYCSERV_ID = ENV['NYCSERV_ID']

# sets a random page number to access opportunities
page_num = rand(43)

# get request 5 random opportunities
random_opps_response = HTTParty.get("https://api.nycservice.org/opportunities/index.php?rest_key=#{NYCSERV_KEY}&account_id=#{NYCSERV_ID}&output=json&list_page=#{page_num}&max_records=5")

# pp random_opps_response

# create a list of random opportunity IDs
random_opp_list = []
random_opps_response['opportunities'].each do |opp|
  random_opp_list.push(opp['opportunity_id'])
end

# create a hash of organizations using the random opportunity list
orgs_list = {}
random_opp_list.each do |opp_id|
  opp_detail_response = HTTParty.get("https://api.nycservice.org/opportunities/index.php?rest_key=#{NYCSERV_KEY}&account_id=#{NYCSERV_ID}&output=json&opp_id=#{opp_id}")
  # set a key-value pair of org_id => []
  orgs_list[opp_detail_response['opportunity']['organization_id']] = []
end

# for each key in the organization list, push in its opp_id
orgs_list.each_pair do |org_id,opp_array|
  org_detail_response = HTTParty.get("https://api.nycservice.org/organizations/index.php?account_id=#{NYCSERV_ID}&rest_key=#{NYCSERV_KEY}&output=json&org_id=#{org_id}")
  # loop through the opportunities for the organization and save the opp_id in the array
  org_detail_response['organization']['opportunities'].each do |opp|
    opp_array.push(opp['opportunity_id'])
  end

  org_name = org_detail_response['organization']['title']
  org_summary = org_detail_response['organization']['summary']
  org_add_hash = org_detail_response['organization']['organization_contact'][0]
  org_address = "#{org_add_hash['street1']} #{org_add_hash['street2']}, #{org_add_hash['locality']}, #{org_add_hash['region']}, #{org_add_hash['postalcode']}"
  org_url = org_detail_response['organization']['organization_url']
  org_thumb = org_detail_response['organization']['thumbnail_url']
  org_phone = 'n/a'
  api_organization_id = org_detail_response['organization']['organization_id'].to_i
  this_org = Org.create(name: org_name,
                        summary: org_summary,
                        address: org_address,
                        website: org_url,
                        thumbnail: org_thumb,
                        phone: org_phone,
                        api_org_id: api_organization_id)

  opp_array.each do |opp_id|
    opp_detail_response = HTTParty.get("https://api.nycservice.org/opportunities/index.php?rest_key=#{NYCSERV_KEY}&account_id=#{NYCSERV_ID}&output=json&opp_id=#{opp_id}")
    opp_title = opp_detail_response['opportunity']['title']
    opp_start = Time.at(opp_detail_response['opportunity']['start_date'].to_i)
    opp_end = Time.at(opp_detail_response['opportunity']['end_date'].to_i)
    opp_summary = opp_detail_response['opportunity']['summary']
    opp_vols = opp_detail_response['opportunity']['vol_requests'].to_i
    opp_recurrence = opp_detail_response['opportunity']['recurrence_type'] == 'ongoing'
    opp_reqs = opp_detail_response['opportunity']['requirements']
    opp_add_hash = opp_detail_response['opportunity']['lccontact'][0]
    opp_address = "#{opp_add_hash['street1']} #{opp_add_hash['street2']}, #{opp_add_hash['locality']}, #{opp_add_hash['region']}, #{opp_add_hash['postalcode']}"
    api_opportunity_id = opp_detail_response['opportunity']['opportunity_id'].to_i

    Opp.create(title: opp_title,
               start_date:  opp_start,
               end_date:  opp_end,
               summary: opp_summary,
               vol_request: opp_vols,
               recurrence: opp_recurrence,
               requirement: opp_reqs,
               location: opp_address,
               api_opp_id: api_opportunity_id,
               org: this_org)
  end
end