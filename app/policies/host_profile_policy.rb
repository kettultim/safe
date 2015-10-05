class HostProfilePolicy < ApplicationPolicy
  def update?
    user.profile == record
  end
end
