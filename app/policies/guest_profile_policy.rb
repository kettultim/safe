class GuestProfilePolicy < ApplicationPolicy
  def update?
    user.profile == record
  end
end
