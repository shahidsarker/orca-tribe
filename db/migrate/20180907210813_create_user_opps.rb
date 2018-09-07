class CreateUserOpps < ActiveRecord::Migration[5.2]
  def change
    create_table :user_opps do |t|
      t.references :user, foreign_key: true
      t.references :opp, foreign_key: true

      t.timestamps
    end
  end
end
