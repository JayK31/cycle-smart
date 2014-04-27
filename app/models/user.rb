# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  # basic validations
  validates :name, presence: true
  # email must be unique, not case sensitive
  validates :email, presence: true, uniqueness: true, case_sensitive: false
  # pw length between 8-16 chars
  validates(:password, { :length       => { :minimum => 8, :maximum => 16 },
                         :presence     => true,
                         :confirmation => true })
  # basic validation of password format
  validates_format_of :email, :with => /@/
  has_secure_password

end
