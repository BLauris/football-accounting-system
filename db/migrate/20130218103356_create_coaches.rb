class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
    	t.string :name
    	t.string :surname
    	t.integer :games_won
      t.integer :games_lost
      t.integer :drawn_games
    	t.date :date_of_birth
    	t.string :trainer_status
    	t.text :description
      t.timestamps
    end
  end
end
