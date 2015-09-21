class CreatePings < ActiveRecord::Migration
  def change
    create_table :pings do |t|
      t.integer :ping
      t.date :start_date
      t.integer :user_id

      t.timestamps
    end
  end
end
