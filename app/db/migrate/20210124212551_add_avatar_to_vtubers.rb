class AddAvatarToVtubers < ActiveRecord::Migration[5.2]
  def change
    add_column :vtubers, :avatar, :string
  end
end
