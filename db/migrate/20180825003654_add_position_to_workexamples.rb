class AddPositionToWorkexamples < ActiveRecord::Migration[5.2]
  def change
    add_column :workexamples, :position, :integer
  end
end
