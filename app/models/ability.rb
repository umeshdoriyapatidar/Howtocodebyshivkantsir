# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Job

    can :create, Job if user.employer?
    can %i[update destroy], Job, user: user
  end
end
