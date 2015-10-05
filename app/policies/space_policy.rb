class SpacePolicy < ApplicationPolicy
  def create?
    user.host?
  end
end
