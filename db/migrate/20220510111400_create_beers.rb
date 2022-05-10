class CreateBeers < ActiveRecord::Migration[7.0]
  def change
    create_table :beers do |t|
      t.string :beer_type
      t.integer :stock

      t.timestamps null: false
    end
  end
end
