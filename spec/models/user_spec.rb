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

require 'spec_helper'

describe User do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  # it { should validate_uniqueness_of(:email).case_insensitive } Could not get this to work
  it { should have_secure_password }
  it { should validate_confirmation_of(:password) }
  it { should ensure_length_of(:password).is_at_least(8).is_at_most(16) }
  it { should allow_value('@').for(:email) }
  it { should_not allow_value('asdfjkl').for(:email) }
end