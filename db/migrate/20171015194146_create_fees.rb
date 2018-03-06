class CreateFees < ActiveRecord::Migration[5.1]
  def change
    create_table :fees do |t|
      t.date :date
      t.string :departure
      t.string :arrival
      t.boolean :type_of_trajet
      t.integer :car
      t.integer :kilometer
      t.float :cost

      t.timestamps
    end
  end
end
