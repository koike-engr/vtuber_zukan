class CreateScflds < ActiveRecord::Migration[5.2]
  def change
    create_table :scflds do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
