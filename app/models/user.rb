class User < ActiveRecord::Base
  # basic validations
  validates :name, presence: true
  # email must be unique, not case sensitive
  validates :email, presence: true, uniqueness: true, case_sensitive: false
  # pw length between 8-16 chars
  validates_length_of :password, in: 8..16
  # basic validation of password format
  validates_format_of :email, :with => /@/
  has_secure_password

end

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, case_sensitive: false
  validates_length_of :password, in: 8..16
  validates_format_of :email, :with => /@/
  has_secure_password
  has_many :trips
  has_many :items, :through => :trips
  has_many :invites
  has_many :trips, :through => :invites
end