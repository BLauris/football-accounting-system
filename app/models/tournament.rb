class Tournament < ActiveRecord::Base
  attr_accessible :title, :user_ids, :description

  has_and_belongs_to_many :users
end
