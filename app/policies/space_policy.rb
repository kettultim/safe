class SpacePolicy < ApplicationPolicy
  def create?
    user.host?
  end

  def update?
    record.user == user
  end

  def show?
    return true
    !(NullUser === user)
  end

  def index?
    return true
    !(NullUser === user)
  end
end
