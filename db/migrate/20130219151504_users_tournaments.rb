class UsersTournaments < ActiveRecord::Migration
  def self.up
    create_table :tournaments_users, :id => false do |t|
        t.references :tournament
        t.references :user
    end
    add_index :tournaments_users, :tournament_id
    add_index :tournaments_users, :user_id 
  end

  def self.down
    drop_table :tournaments_users
  end
end
