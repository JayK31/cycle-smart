# == Schema Information
#
# Table name: routes
#
#  id           :integer          not null, primary key
#  start_point  :string(255)
#  end_point    :string(255)
#  safety_score :integer
#  description  :text
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#

class Route < ActiveRecord::Base
end
