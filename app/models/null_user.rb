class NullUser
  def admin?
    false
  end
  alias_method :admin, :admin?

  def email
    nil
  end
end
