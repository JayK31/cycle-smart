class AddDescriptionToTrafficIncidents < ActiveRecord::Migration
  def change
    add_column :traffic_incidents, :description, :string
  end
end
