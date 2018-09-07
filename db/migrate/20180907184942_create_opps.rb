class CreateOpps < ActiveRecord::Migration[5.2]
  def change
    create_table :opps do |t|
      t.string :title
      t.date :start_date 
      t.date :end_date 
      t.text :summary #blurb describing the opportunity
      t.integer :vol_request #amount of vols needed
      t.boolean :recurrence #is it on-time or ongoing?
      t.text :requirement  #special notes for vols such as additional skills/info needed from vols
      t.string :location #address specific to the opportunity
      t.timestamps :created_at #creation date incase we need to organize by most recent etc.
      t.integer :api_opp_id #d referenced from API
  end
end

#milly -we have generated migrations 
#      but not RUN: rake db:migrate
#      DO NOT RUN DB:MIGRATE (will generate SCHEMA)
#      until we create/finalize allthe migration tables