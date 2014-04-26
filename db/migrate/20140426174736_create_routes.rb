class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :start_point
      t.string :end_point
      t.integer :safety_score
      t.text :description

      t.timestamps
    end
  end
end
