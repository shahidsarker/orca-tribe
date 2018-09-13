class AddBoroughToOpps < ActiveRecord::Migration[5.2]
  def change
    add_column :opps, :borough, :string, :default => ''
  end
end
