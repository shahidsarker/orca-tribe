class AddForeignKeyToOpps < ActiveRecord::Migration[5.2]
  def change
    add_reference :opps, :org, foreign_key: true
    # add_foreign_key :opps, :orgs
  end
end
