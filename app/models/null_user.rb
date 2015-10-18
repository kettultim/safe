class NullUser
  def admin?
    false
  end
  alias_method :admin, :admin?

  def email
    nil
  end

  def guest?
    false
  end

  def host?
    false
  end
end
