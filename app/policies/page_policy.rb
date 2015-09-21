class PagePolicy < ApplicationPolicy
  def create?
    user.admin?
  end
end
