class User < ActiveRecord::Base
  ROLES = ['admin', 'host', 'guest']

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates :role, inclusion: { in: ROLES }, presence: true

  def admin?
    role == 'admin'
  end
  alias_method :admin, :admin?

  def self.roles
    ROLES
  end

  def self.sign_up_roles
    ['guest', 'host']
  end
end
