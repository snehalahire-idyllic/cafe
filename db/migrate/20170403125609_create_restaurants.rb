class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :ratings
      t.text :locality
      t.timestamps
    end
  end
end
`