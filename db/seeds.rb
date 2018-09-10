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