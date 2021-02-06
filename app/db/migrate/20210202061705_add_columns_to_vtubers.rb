class AddColumnsToVtubers < ActiveRecord::Migration[5.2]
  def change
    add_column :vtubers, :youtube_views, :integer
    add_column :vtubers, :company, :string
    add_column :vtubers, :registered_day, :date
    add_column :vtubers, :link_to_channel, :string
  end
end
