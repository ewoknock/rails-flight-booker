class AddStateToAirport < ActiveRecord::Migration[7.1]
  def change
    add_column :airports, :state, :string
  end
end
