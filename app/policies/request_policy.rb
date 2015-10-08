class RequestPolicy < ApplicationPolicy
  def create?
    user.guest?
  end
end
