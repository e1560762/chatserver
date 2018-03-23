class AddNameHashToRoom < ActiveRecord::Migration[5.1]
  def up
  	add_column :rooms, :name_as_hash, :string
  end

  def down
  	remove_column :rooms, :name_as_hash, :string
  end
end
