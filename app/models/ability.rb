# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    # user ||= User.new # Guest user (not logged in)

    # if user.admin?
    #   can :manage, :all
    # else
    #   can :read, :all
    # end
    user ||= User.new # Guest user (not logged in)

    if user.admin?
      can :manage, :all
    elsif user.moderator?
      can :read, Article
      can :update, Article
    elsif user.user?
      can :read, Article
      can :create, Article
      can :destroy, user_id=user.id
      # Define other abilities for regular users here
    else
      can :read, Article
      # Define abilities for guest users here
    end
  end
end