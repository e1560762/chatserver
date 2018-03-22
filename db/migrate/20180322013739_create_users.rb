class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.boolean :is_login
      t.datetime :last_connected_time
      t.string :last_connected_ip

      t.timestamps
    end
  end
end
