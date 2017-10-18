class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :model
      t.references :scale, foreign_key: true

      t.timestamps
    end
  end
end
