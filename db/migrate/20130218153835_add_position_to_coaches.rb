class AddPositionToCoaches < ActiveRecord::Migration
  def change
  	add_column :coaches, :position, :string
  end
end
