class User < ActiveRecord::Base
  ROLES = [:admin]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  def admin?
    role == 'admin'
  end
  alias_method :admin, :admin?

  def self.roles
    ROLES
  end
end
