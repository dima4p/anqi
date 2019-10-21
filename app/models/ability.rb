# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new # guest user (not logged in)

    # Guests
    # return if user.new_record? # Guests

    # if user.is_admin?
      can :manage, :all
      # can :list, :all
    # end
  end
end
