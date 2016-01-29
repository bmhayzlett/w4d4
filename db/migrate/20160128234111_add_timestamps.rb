class AddTimestamps < ActiveRecord::Migration
  def change

    add_column :tracks, :created_at, :datetime
    add_column :tracks, :updated_at, :datetime
  end
end
