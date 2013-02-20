class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
    	t.string :name
    	t.string :surname
    	t.date :date_of_birth
    	t.string :position
    	t.string :citizenship
      t.timestamps
    end
  end
end
