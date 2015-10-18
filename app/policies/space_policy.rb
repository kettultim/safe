class SpacePolicy < ApplicationPolicy
  def create?
    user.host?
  end

  def update?
    record.user == user
  end

  def show?
    true #!(NullUser === user)
  end

  def index?
    true #!(NullUser === user)
  end
end
