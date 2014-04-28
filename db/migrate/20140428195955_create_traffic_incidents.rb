class CreateTrafficIncidents < ActiveRecord::Migration
  def change
    create_table :traffic_incidents do |t|
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
