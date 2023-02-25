class CreateBeers < ActiveRecord::Migration[7.0]
  def change
    create_table :beers do |t|
      t.integer :product_number
      t.integer :beer_number
      t.string :name
      t.string :configuration
      t.string :image_url
      t.string :category
      t.decimal :abv
      t.string :beer_type
      t.string :brewery
      t.string :country

      t.timestamps
    end
  end
end
