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

#imani: >>>>>>>>> BLANK USER TEMPLATE<<<<<<<<<<<<<<
#imani: note that when created a new user encrypted_password: should be change to password:.It will encryt once seeded.

# User.create(
#     email: '',
#     encrypted_password: '',
#     first_name: '',
#     last_name: '',
#     location: '',
#     avatar: '',
#     bio: ''
# )


# User.create(
#     email: 'asimone@gmail.com',
#     password: 'password',
#     first_name: 'Ashley',
#     last_name: 'Simone',
#     location: 'Brooklyn',
#     avatar: '/assets/default_user.png',
#     bio: 'We must stand up, move the needle emerging do-gooder entrepreneur movements. Co-creation overcome injustice collaborative consumption theory of change the design thinking. Inclusion, thought provoking activate shine white paper. Segmentation empower communities a save the world framework vibrant inspire.'
# )


# User.create(
#     email: 'dpatlut@gmail.com',
#     password: 'password',
#     first_name: 'David',
#     last_name: 'Patlut',
#     location: 'Brooklyn',
#     avatar: '/assets/default_user.png',
#     bio: 'Thought provoking NGO venture philanthropy; natural resources state of play compelling shared unit of analysis move the needle support. Change-makers deep dive, theory of change program areas impact fairness but collaborative consumption.'
# )


# User.create(
#     email: 'jmurphy@gmail.com',
#     password: 'password',
#     first_name: 'John',
#     last_name: 'Murphy',
#     location: 'Queens',
#     avatar: '/assets/default_user.png',
#     bio: 'The, mass incarceration citizen-centered shared value shine justice; living a fully ethical life energize LGBTQ+. The, replicable commitment citizen-centered, scalable. Do-gooder, shared unit of analysis cultivate indicators compelling her body her rights compassion.'
# )
# >>>>>>>>> REQUIREMENTS TO CREATE AN ORG <<<<<<<<<<<<<<
# t.string "name"
# t.text "summary"
# t.string "address"
# t.string "website"
# t.string "thumbnail"
# t.string "phone"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.integer "api_org_id"



#imani: >>>>>>>>> BLANK ORG TEMPLATE<<<<<<<<<<<<<<

# Org.create(
#     name: '',
#     summary: '',
#     address: '',
#     website: '',
#     thumbnail: '',
#     phone: '',
#     api_org_id: ''
# )

    # Org.create(
    #     name: 'Sample Organization 1',
    #     summary: 'Mass incarceration citizen-centered shared value shine justice; living a fully ethical life energize LGBTQ+. The, replicable commitment citizen-centered, scalable. Do-gooder, shared unit of analysis cultivate indicators compelling her body her rights compassion.',
    #     address: '123 address St New York NY 11222',
    #     website: 'www.organization.com',
    #     thumbnail: '/assets/default_user.png',
    #     phone:  '631-357-1164',
    #     api_org_id: 34
    # )




    # >>>>>>>>> REQUIREMENTS TO CREATE AN OPP <<<<<<<<<<<<<<
    # t.string "title"
    # t.date "start_date"
    # t.date "end_date"
    # t.text "summary"
    # t.integer "vol_request"
    # t.boolean "recurrence"
    # t.text "requirement"
    # t.string "location"
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false
    # t.integer "api_opp_id"



    # Opp.create(
    #     title: "Soup Kitchen Saturdays",
    #     start_date:  DateTime.new(2018,11,20),
    #     end_date:  DateTime.new(2019,11,21),
    #     summary: "Serve meals to community members on Saturdays",
    #     vol_request: 10,
    #     recurrence: true,
    #     requirement: "We just need people who are willing and happy to spend time feeding needy folks",
    #     location: "123 Street st New York NY 11222",
    #     api_opp_id: 34,
    #     org_id: 1
    # )
require 'httparty'

NYCSERV_KEY = ENV['NYCSERV_KEY']
NYCSERV_ID = ENV['NYCSERV_ID']

# sets a random page number to access opportunities
page_num = rand(43)

# response from http GET request to organization listings
# org_response = HTTParty.get("https://api.nycservice.org/organizations/index.php?rest_key=#{NYCSERV_KEY}&account_id=#{NYCSERV_ID}&list_page=#{page_num}&output=json&max_records=10")

# creates a list of organization_id values from the org listing http response
# org_list = []
# org_response['organizations'].each do |org|
#   org_list.push(org['organization_id'])
# end

# org_id = org_list.sample
# org_detail_response =  HTTParty.get("https://api.nycservice.org/organizations/index.php?account_id=#{NYCSERV_ID}&rest_key=#{NYCSERV_KEY}&output=json&org_id=#{org_id}")

# pp org_detail_response

# get request random opportunities
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
  pp org_name
  org_summary = org_detail_response['organization']['summary']
  pp org_summary
  org_add_hash = org_detail_response['organization']['organization_contact'][0]
  pp org_add_hash
  org_address = "#{org_add_hash['street1']} #{org_add_hash['street2']}, #{org_add_hash['locality']}, #{org_add_hash['region']}, #{org_add_hash['postalcode']}"
  pp org_address
  org_url = org_detail_response['organization']['organization_url']
  pp org_url
  org_thumb = org_detail_response['organization']['thumbnail_url']
  pp org_thumb
  org_phone = 'n/a'
  pp org_phone
  api_organization_id = org_detail_response['organization']['organization_id'].to_i
  pp api_organization_id
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
    pp opp_title
    opp_start = Time.at(opp_detail_response['opportunity']['start_date'].to_i)
    pp opp_start
    opp_end = Time.at(opp_detail_response['opportunity']['end_date'].to_i)
    pp opp_end
    opp_summary = opp_detail_response['opportunity']['summary']
    pp opp_summary
    opp_vols = opp_detail_response['opportunity']['vol_requests'].to_i
    pp opp_vols
    opp_recurrence = opp_detail_response['opportunity']['recurrence_type'] == 'ongoing'
    pp opp_recurrence
    opp_reqs = opp_detail_response['opportunity']['requirements']
    pp opp_reqs
    opp_add_hash = opp_detail_response['opportunity']['lccontact'][0]
    pp opp_add_hash
    opp_address = "#{opp_add_hash['street1']} #{opp_add_hash['street2']}, #{opp_add_hash['locality']}, #{opp_add_hash['region']}, #{opp_add_hash['postalcode']}"
    pp opp_address
    api_opportunity_id = opp_detail_response['opportunity']['organization_id'].to_i
    pp api_opportunity_id

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