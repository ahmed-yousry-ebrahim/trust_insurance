class AddAnonymousToExperience < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :anonymous, :boolean
  end
end
