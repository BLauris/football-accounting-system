class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
    	t.string :name
    	t.string :surname
    	t.text :description
    	t.date :date_of_birth
    	t.string :position
    	t.string :citizenship
    	t.integer :yellow_card
    	t.integer :red_card
    	t.float :height
    	t.float :weight
    	t.integer :goals_scored
    	t.integer :assists
    	t.integer :minutes_played
    	t.integer :number
      t.timestamps
    end
  end
end
