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

# >>>>>>>>> BLANK USER TEMPLATE<<<<<<<<<<<<<<

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
    encrypted_password: 'password',
    first_name: 'Ashley',
    last_name: 'Simone',
    location: 'Brooklyn',
    avatar: '',
    bio: 'We must stand up, move the needle emerging do-gooder entrepreneur movements. Co-creation overcome injustice collaborative consumption theory of change the design thinking. Inclusion, thought provoking activate shine white paper. Segmentation empower communities a save the world framework vibrant inspire.'
)

