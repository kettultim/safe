class PagePolicy < ApplicationPolicy
  def create?
    user.admin?
  end

  def update?
    user.admin?
  end
end
