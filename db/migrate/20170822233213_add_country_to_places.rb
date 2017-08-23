class AddCountryToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :country, :string
  end
end
