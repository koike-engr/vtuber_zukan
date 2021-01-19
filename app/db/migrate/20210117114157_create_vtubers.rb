class CreateVtubers < ActiveRecord::Migration[5.2]
  def change
    create_table :vtubers do |t|
      t.string :name
      t.integer :subscribers

      t.timestamps
    end
  end
end
