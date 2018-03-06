class ChangeVehicleTypeStringToInt < ActiveRecord::Migration[5.1]
  def change
    change_column :scales, :vehicle_type, :integer
  end
end
