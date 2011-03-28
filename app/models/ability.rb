class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.roles == 'super'
      can :manage, :all
    elsif user.admin?
      can :manage, Project
    else
      can :update, Project do |project|
        Permission.of(user, project).level == 'update'
      end
      can :update, Call do |call|
        Permission.of(user, call.project).level == 'update'
      end
    end
  end
end