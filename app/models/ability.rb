# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Resort, user: user
    can %i[read, destroy], Reservation, user: user

    return unless user.role == 'admin'

    can :manage, Resort
    can :manage, Reservation
  end
end
