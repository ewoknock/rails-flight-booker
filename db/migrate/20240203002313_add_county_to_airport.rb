class AddCountyToAirport < ActiveRecord::Migration[7.1]
  def change
    add_column :airports, :county, :string
  end
end
