class CreateOrgs < ActiveRecord::Migration[5.2]
  def change
    create_table :orgs do |t|
        t.string :name #of the oorganization
        t.text :summary #blurb on org, mission statement, etc 
        t.string :address #address of hq for organization
        t.string :website #web address url 
        t.string :thumbnail #image/logo of org 
        t.string :phone  #tel num
  end
end


#milly