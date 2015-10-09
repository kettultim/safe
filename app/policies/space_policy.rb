class SpacePolicy < ApplicationPolicy
  def create?
    user.host?
  end

  def update?
    record.user == user
  end

  def show?
    !(NullUser === user)
  end

  def index?
    !(NullUser === user)
  end
end
