class AddBoroughToOrgs < ActiveRecord::Migration[5.2]
  def change
    add_column :orgs, :borough, :string, :default => ''
  end
end
