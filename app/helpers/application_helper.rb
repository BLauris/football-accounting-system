module ApplicationHelper

	 def devise_mapping
    Devise.mappings[:user]
  end

  def coach_position
    [["not specified"],["Head coach"],["Asistent"],["Goalkeeping coach"],["Fitness coach"]]
  end

  def player_position
    [["not specified"],["Goalkeeper"],["Defender"],["Midfielder"],["Forward"]]
  end

  def staff_position
    [["not specified"],["Physiotherapist"],["Masseur"],["Team doctor"],["Osteopath"],["Kitman"],["Cook"]]
  end

end
