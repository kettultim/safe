class AvailabilityPolicy < ApplicationPolicy
  def create?
    record.space.user == user
  end

  def destroy?
    record.space.user == user
  end

  def show?
    true
  end
end
