class AddSentdayToUser < ActiveRecord::Migration
  def up
    add_column :users, :sent_day, :integer
  end

  def down
    remove_column :users, :sent_day
  end
end
