class AdminPolicy < Struct.new(:user, :dashboard)
  def access?
    user.admin?
  end
end
