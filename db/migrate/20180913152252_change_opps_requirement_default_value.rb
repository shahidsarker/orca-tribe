class ChangeOppsRequirementDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:opps, :requirement, '')
  end
end
