class Staff < ActiveRecord::Base
  attr_accessible :name, :surname, :date_of_birth, :position, :citizenship, :user_id

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