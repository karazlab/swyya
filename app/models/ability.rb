class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    user ||= User.new
    @user = user
    @user.has_role?(ROLES[:superadmin]) ? superadmin_management : @user.has_role?(ROLES[:user]) ? user_management : visitor_management
  end

  def user_management
    can %i[index read like dislike], Project
    can :manage, Project, user_id: user.id

    can %i[index read like dislike], Idea
    can :manage, Idea, user_id: user.id

    can :index, BoardsController
  end

  def superadmin_management
    can :manage, :all
  end

  def visitor_management
    can :read, :all
  end
end
