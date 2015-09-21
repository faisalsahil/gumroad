class AddCraditCardInfoToUser < ActiveRecord::Migration
  def up
    add_column :users, :expired, :string
    add_column :users, :fingerprint, :string
    add_column :users, :expiry_date, :date
  end
  def down
    remove_column :users, :expired
    remove_column :users, :fingerprint
    remove_column :users, :expiry_date
  end
end
