class Coach < ActiveRecord::Base
  attr_accessible(:name, :surname, :games_won, :user_id,
  								:games_lost, :drawn_games, :date_of_birth, 
                  :description, :position, :citizenship
  							)

  belongs_to :user

  has_many :assets, as: :assetable, dependent: :destroy
  accepts_nested_attributes_for :assets

  def first_image_url
    if assets.first
      assets.first.file(:thumb)
    else
      "no_img.jpg"
    end
  end

  def total_games
    return games_lost + games_won + drawn_games
  end

  def full_name
    return name + " " + surname
  end
end