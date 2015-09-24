module ApplicationHelper
  def role_select
    User.roles.map { |role|
      # ['Admin', 'admin']
      [role.to_s.titleize, role]
    }
  end
end
