class CreateRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :rewards do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :current_points
      t.integer :daily_points
      t.integer :weekly_points
      t.integer :monthly_points

      t.timestamps
    end
  end
end
