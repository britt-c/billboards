class AddCountryToBillboards < ActiveRecord::Migration[6.0]
  def change
    add_column :billboards, :country, :string
  end
end
