class CreateOrgs < ActiveRecord::Migration[5.2]
  def change
    create_table :orgs do |t|
        t.string :name #of the oorganization
        t.text :summary #blurb on org, mission statement, etc 
        t.string :address #address of hq for organization
        t.string :website #web address url 
        t.string :thumbnail #image/logo of org 
        t.string :phone  #tel num
        t.timestamps :created_at #creation date incase we need to organize by most recent etc.
        t.timestamps :updated_at
        t.integer :api_org_id #reference id from API
  end
end


#milly -we have generated migrations 
#      but not RUN: rake db:migrate
#      DO NOT RUN DB:MIGRATE (will generate SCHEMA)
#      until we create/finalize allthe migration tables