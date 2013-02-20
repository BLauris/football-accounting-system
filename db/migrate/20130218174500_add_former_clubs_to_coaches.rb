class AddFormerClubsToCoaches < ActiveRecord::Migration
  def change
  	add_column :coaches, :former_clubs, :string
  end
end
