class AddReputationPointsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :reputation_points, :integer, default: 0
  end
end
