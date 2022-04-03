class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  DOMAIN_REGEX = /[\p{L}0-9]+([\-.]{1}[\p{L}0-9]+)*\.\p{L}{2,63}/i.freeze
  EMAIL_PATTERN_REGEX = %r{(?=\A.{6,255}\z)(\A([\p{L}0-9]+[\w\p{L}.+!~,'&%#*^`{}|\-/?=$]*)@(#{DOMAIN_REGEX})\z)}.freeze

  ROLE_SUPER_ADMIN = "super_admin"
  ROLE_MEMBER = "member"
  ROLES = [ROLE_SUPER_ADMIN, ROLE_MEMBER]

  has_many :hash_maps

  validates :email, uniqueness: true, format: { with: EMAIL_PATTERN_REGEX }
  validates_presence_of :role

  after_create :generate_username

  def is_super_admin?
    role == ROLE_SUPER_ADMIN
  end

  def generate_username
    self.update(username: UsernameGenerator.new.run(self))
  end
end
