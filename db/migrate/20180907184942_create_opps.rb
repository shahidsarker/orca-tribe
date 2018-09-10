class CreateOpps < ActiveRecord::Migration[5.2]
  def change
    create_table :opps do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.text :summary
      t.integer :vol_request
      t.boolean :recurrence
      t.text :requirement
      t.string :location
      t.timestamps
      t.integer :api_opp_id
      t.integer :org_id
    end
  end
end