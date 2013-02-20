class AddCitizenshipToCoaches < ActiveRecord::Migration
  def change
  	add_column :coaches, :citizenship, :string
  end
end
