class AddUserIdToStaffsAndPlayers < ActiveRecord::Migration
  def change
  	add_column :players, :user_id, :integer
  	add_column :staffs, :user_id, :integer
  end
end
