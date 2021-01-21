class AddSuperchatsToVtuber < ActiveRecord::Migration[5.2]
  def change
    add_column :vtubers, :superchats, :int
  end
end
