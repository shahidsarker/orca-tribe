class RemovePhoneFromOrgs < ActiveRecord::Migration[5.2]
  def change
    remove_column :orgs, :phone, :string
  end
end
