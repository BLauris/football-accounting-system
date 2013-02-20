class Ability
  include CanCan::Ability
  def initialize(user)
    if user.is_user?
      can :manage, Coach, :user_id => user.id
      can :manage, Player, :user_id => user.id
    elsif user.is_admin?
      can :administrate
      can :manage, :all
    end
  end
end