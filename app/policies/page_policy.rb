class PagePolicy < ApplicationPolicy
  def show?
    super && (record.published? || user.admin?)
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin? && !record.published?
  end
end
