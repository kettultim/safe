class SpacePolicy < ApplicationPolicy
  def create?
    user.host?
  end

  def update?
    record.user == user
  end
end
