class User < ActiveRecord::Base
  ROLES = ['admin', 'host', 'guest']

  ROLES.each do |role|
    define_method role do
      self.role == role
    end
    define_method "#{role}?" do
      self.role == role
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates :role, inclusion: { in: ROLES }, presence: true

  belongs_to :profile, polymorphic: true, dependent: :destroy
  has_many :spaces, dependent: :destroy

  delegate :about, to: :profile, allow_nil: true

  after_create do |u|
    if !u.profile
      if u.guest?
        u.profile = GuestProfile.new
        u.profile.save(validate: false)
        u.save
      elsif u.host?
        u.profile = HostProfile.new
        u.profile.save(validate: false)
        u.save
      end
    end
  end

  def self.roles
    ROLES
  end

  def self.sign_up_roles
    ['guest', 'host']
  end

  def valid_profile?
    profile.valid?
  end
end
