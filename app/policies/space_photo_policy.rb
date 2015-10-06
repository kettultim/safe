class SpacePhotoPolicy < ApplicationPolicy
  def create?
    record.space.user == user
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
