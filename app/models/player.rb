class Player < ActiveRecord::Base
  attr_accessible(:name, :surname, :description,
    							:date_of_birth, :position, :citizenship,
    							:yellow_card, :red_card, :height, :weight,
    							:goals_scored, :assists, :minutes_played, :number
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

  def full_name
    return name + " " + surname
  end
end
