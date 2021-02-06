class AddDetailedColumnsToVideo < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :views, :integer
    add_column :videos, :likes, :integer
    add_column :videos, :published_day, :date
  end
end
