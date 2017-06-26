class CreateFloors < ActiveRecord::Migration[5.1]
  def change
    create_table :floors do |t|
      t.integer :number
      t.references :building, foreign_key: true

      t.timestamps
    end
  end
end
