class CreateAirports < ActiveRecord::Migration[7.1]
  def change
    create_table :airports do |t|
      t.string :name
      t.string :code
      t.string :country_id
      t.string :country
      t.string :city
      t.timestamps
    end
  end
end
