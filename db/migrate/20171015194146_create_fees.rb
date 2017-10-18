class CreateFees < ActiveRecord::Migration[5.1]
  def change
    create_table :fees do |t|
      t.date :date
      t.string :departure
      t.string :arrival
      t.boolean :type_of_trajet
      t.references :user, foreign_key: true
      t.references :car, foreign_key: true
      t.integer :kilometer
      t.float :cost

      t.timestamps
    end
  end
end
