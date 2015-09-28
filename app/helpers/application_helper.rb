module ApplicationHelper
  def role_select
    User.roles.map { |role|
      [role.to_s.titleize, role] # => ['Admin', 'admin']
    }
  end
end
