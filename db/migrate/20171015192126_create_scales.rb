class CreateScales < ActiveRecord::Migration[5.1]
  def change
    create_table :scales do |t|
      t.string :vehicle_type
      t.float :coefficient
      t.string :fiscal_power
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
