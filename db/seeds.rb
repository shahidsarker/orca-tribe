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

User.create!(
    email: 'asimone@gmail.com',
    password: 'password',
    first_name: 'Ashley',
    last_name: 'Simone',
    location: 'Brooklyn',
    avatar: '/assets/default_user.png',
    bio: 'We must stand up, move the needle emerging do-gooder entrepreneur movements. Co-creation overcome injustice collaborative consumption theory of change the design thinking. Inclusion, thought provoking activate shine white paper. Segmentation empower communities a save the world framework vibrant inspire.'
)

User.create!(
    email: 'dpatlut@gmail.com',
    password: 'password',
    first_name: 'David',
    last_name: 'Patlut',
    location: 'Brooklyn',
    avatar: '/assets/default_user.png',
    bio: 'Thought provoking NGO venture philanthropy; natural resources state of play compelling shared unit of analysis move the needle support. Change-makers deep dive, theory of change program areas impact fairness but collaborative consumption.'
)


User.create!(
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


zipboro = {"11361" => "Queens",
           "11362" => "Queens",
           "11363" => "Queens",
           "11364" => "Queens",
           "11354" => "Queens",
           "11355" => "Queens",
           "11356" => "Queens",
           "11357" => "Queens",
           "11358" => "Queens",
           "11359" => "Queens",
           "11360" => "Queens",
           "11365" => "Queens",
           "11366" => "Queens",
           "11367" => "Queens",
           "11412" => "Queens",
           "11423" => "Queens",
           "11432" => "Queens",
           "11433" => "Queens",
           "11434" => "Queens",
           "11435" => "Queens",
           "11436" => "Queens",
           "11101" => "Queens",
           "11102" => "Queens",
           "11103" => "Queens",
           "11104" => "Queens",
           "11105" => "Queens",
           "11106" => "Queens",
           "11374" => "Queens",
           "11375" => "Queens",
           "11379" => "Queens",
           "11385" => "Queens",
           "11691" => "Queens",
           "11692" => "Queens",
           "11693" => "Queens",
           "11694" => "Queens",
           "11695" => "Queens",
           "11697" => "Queens",
           "11004" => "Queens",
           "11005" => "Queens",
           "11411" => "Queens",
           "11413" => "Queens",
           "11422" => "Queens",
           "11426" => "Queens",
           "11427" => "Queens",
           "11428" => "Queens",
           "11429" => "Queens",
           "11414" => "Queens",
           "11415" => "Queens",
           "11416" => "Queens",
           "11417" => "Queens",
           "11418" => "Queens",
           "11419" => "Queens",
           "11420" => "Queens",
           "11421" => "Queens",
           "11368" => "Queens",
           "11369" => "Queens",
           "11370" => "Queens",
           "11372" => "Queens",
           "11373" => "Queens",
           "11377" => "Queens",
           "11378" => "Queens",
           "10302" => "Staten Island",
           "10303" => "Staten Island",
           "10310" => "Staten Island",
           "10306" => "Staten Island",
           "10307" => "Staten Island",
           "10308" => "Staten Island",
           "10309" => "Staten Island",
           "10312" => "Staten Island",
           "10301" => "Staten Island",
           "10304" => "Staten Island",
           "10305" => "Staten Island",
           "10314" => "Staten Island",
           "10026" => "Manhattan",
           "10027" => "Manhattan",
           "10030" => "Manhattan",
           "10037" => "Manhattan",
           "10039" => "Manhattan",
           "10001" => "Manhattan",
           "10011" => "Manhattan",
           "10018" => "Manhattan",
           "10019" => "Manhattan",
           "10020" => "Manhattan",
           "10036" => "Manhattan",
           "10029" => "Manhattan",
           "10035" => "Manhattan",
           "10010" => "Manhattan",
           "10016" => "Manhattan",
           "10017" => "Manhattan",
           "10022" => "Manhattan",
           "10012" => "Manhattan",
           "10013" => "Manhattan",
           "10014" => "Manhattan",
           "10004" => "Manhattan",
           "10005" => "Manhattan",
           "10006" => "Manhattan",
           "10007" => "Manhattan",
           "10038" => "Manhattan",
           "10280" => "Manhattan",
           "10002" => "Manhattan",
           "10003" => "Manhattan",
           "10009" => "Manhattan",
           "10021" => "Manhattan",
           "10028" => "Manhattan",
           "10044" => "Manhattan",
           "10065" => "Manhattan",
           "10075" => "Manhattan",
           "10128" => "Manhattan",
           "10023" => "Manhattan",
           "10024" => "Manhattan",
           "10025" => "Manhattan",
           "10031" => "Manhattan",
           "10032" => "Manhattan",
           "10033" => "Manhattan",
           "10034" => "Manhattan",
           "10040" => "Manhattan",
           "10453" => "The Bronx",
           "10457" => "The Bronx",
           "10460" => "The Bronx",
           "10458" => "The Bronx",
           "10467" => "The Bronx",
           "10468" => "The Bronx",
           "10451" => "The Bronx",
           "10452" => "The Bronx",
           "10456" => "The Bronx",
           "10454" => "The Bronx",
           "10455" => "The Bronx",
           "10459" => "The Bronx",
           "10474" => "The Bronx",
           "10463" => "The Bronx",
           "10471" => "The Bronx",
           "10466" => "The Bronx",
           "10469" => "The Bronx",
           "10470" => "The Bronx",
           "10475" => "The Bronx",
           "10461" => "The Bronx",
           "10462" => "The Bronx",
           "10464" => "The Bronx",
           "10465" => "The Bronx",
           "10472" => "The Bronx",
           "10473" => "The Bronx",
           "11212" => "Brooklyn",
           "11213" => "Brooklyn",
           "11216" => "Brooklyn",
           "11233" => "Brooklyn",
           "11238" => "Brooklyn",
           "11209" => "Brooklyn",
           "11214" => "Brooklyn",
           "11228" => "Brooklyn",
           "11204" => "Brooklyn",
           "11218" => "Brooklyn",
           "11219" => "Brooklyn",
           "11230" => "Brooklyn",
           "11234" => "Brooklyn",
           "11236" => "Brooklyn",
           "11239" => "Brooklyn",
           "11223" => "Brooklyn",
           "11224" => "Brooklyn",
           "11229" => "Brooklyn",
           "11235" => "Brooklyn",
           "11201" => "Brooklyn",
           "11205" => "Brooklyn",
           "11215" => "Brooklyn",
           "11217" => "Brooklyn",
           "11231" => "Brooklyn",
           "11203" => "Brooklyn",
           "11210" => "Brooklyn",
           "11225" => "Brooklyn",
           "11226" => "Brooklyn",
           "11207" => "Brooklyn",
           "11208" => "Brooklyn",
           "11211" => "Brooklyn",
           "11222" => "Brooklyn",
           "11220" => "Brooklyn",
           "11232" => "Brooklyn",
           "11206" => "Brooklyn",
           "11221" => "Brooklyn",
           "11237" => "Brooklyn"
}

# sets a random page number to access opportunities
page_num = rand(11)

# get request 5 random opportunities
random_opps_response = HTTParty.get("https://api.nycservice.org/opportunities/index.php?rest_key=#{NYCSERV_KEY}&account_id=#{NYCSERV_ID}&output=json&list_page=#{page_num}&max_records=40")
puts 'random opps response:'
pp random_opps_response

# create a list of random opportunity IDs
random_opp_list = []
random_opps_response['opportunities'].each do |opp|
  random_opp_list.push(opp['opportunity_id'])
end

# create a hash of organizations using the random opportunity list
orgs_list = {}
random_opp_list.each do |opp_id|
  opp_detail_response = HTTParty.get("https://api.nycservice.org/opportunities/index.php?rest_key=#{NYCSERV_KEY}&account_id=#{NYCSERV_ID}&output=json&opp_id=#{opp_id}")
  puts 'opp detail response'
  pp opp_detail_response
  if opp_detail_response['errorCode'] == nil
    # set a key-value pair of org_id => []
    orgs_list[opp_detail_response['opportunity']['organization_id']] = []
  else
    break
  end
end

puts 'orgs list'
pp orgs_list

# for each key in the organization list, push in its opp_id
orgs_list.each_pair do |org_id, opp_array|
  org_detail_response = HTTParty.get("https://api.nycservice.org/organizations/index.php?account_id=#{NYCSERV_ID}&rest_key=#{NYCSERV_KEY}&output=json&org_id=#{org_id}")
  puts 'org details response'
  pp org_detail_response
  # loop through the opportunities for the organization and save the opp_id in the array
  org_detail_response['organization']['opportunities'].each do |opp|
    opp_array.push(opp['opportunity_id'])
  end

  org_name = org_detail_response['organization']['title']
  org_summary = org_detail_response['organization']['summary']
  org_add_hash = org_detail_response['organization']['organization_contact'][0]
  org_address = "#{org_add_hash['street1']} #{org_add_hash['street2']}, #{org_add_hash['locality']}, #{org_add_hash['region']}, #{org_add_hash['postalcode']}"
  if zipboro[org_add_hash['postalcode']] != nil
    org_boro = zipboro[org_add_hash['postalcode']]
  else
    org_boro = 'Other'
  end
  org_url = org_detail_response['organization']['organization_url']
  org_thumb = org_detail_response['organization']['thumbnail_url']
  api_organization_id = org_detail_response['organization']['organization_id'].to_i
  this_org = Org.create!(name: org_name,
                         summary: org_summary,
                         address: org_address,
                         website: org_url,
                         thumbnail: org_thumb,
                         # phone: org_phone,
                         api_org_id: api_organization_id,
                         borough: org_boro)
  puts opp_array

  opp_array.each do |opp_id|
    opp_detail_response = HTTParty.get("https://api.nycservice.org/opportunities/index.php?rest_key=#{NYCSERV_KEY}&account_id=#{NYCSERV_ID}&output=json&opp_id=#{opp_id}")
    puts 'opp detail again'
    pp opp_detail_response
    if opp_detail_response['errorCode'] == nil
      opp_title = opp_detail_response['opportunity']['title']
      opp_start = Time.at(opp_detail_response['opportunity']['start_date'].to_i)
      opp_end = Time.at(opp_detail_response['opportunity']['end_date'].to_i)
      opp_summary = opp_detail_response['opportunity']['summary']
      opp_vols = opp_detail_response['opportunity']['vol_requests'].to_i
      opp_recurrence = opp_detail_response['opportunity']['recurrence_type'] == 'ongoing'
      if opp_detail_response['opportunity']['requirements'] != nil
        opp_reqs = opp_detail_response['opportunity']['requirements']
      else
        opp_reqs = ' '
      end
      opp_add_hash = opp_detail_response['opportunity']['lccontact'][0]
      opp_address = "#{opp_add_hash['street1']} #{opp_add_hash['street2']}, #{opp_add_hash['locality']}, #{opp_add_hash['region']}, #{opp_add_hash['postalcode']}"
      if zipboro[opp_add_hash['postalcode']] != nil
        opp_boro = zipboro[opp_add_hash['postalcode']]
      else
        opp_boro = 'Other'
      end
      api_opportunity_id = opp_detail_response['opportunity']['opportunity_id'].to_i
      Opp.create!(title: opp_title,
                  start_date: opp_start,
                  end_date: opp_end,
                  summary: opp_summary,
                  vol_request: opp_vols,
                  recurrence: opp_recurrence,
                  requirement: opp_reqs,
                  location: opp_address,
                  api_opp_id: api_opportunity_id,
                  org: this_org,
                  borough: opp_boro)
    else
      break
    end
  end
end