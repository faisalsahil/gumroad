class AddColumnsToCardinfo < ActiveRecord::Migration
  def change
  	add_column :cardinfos, :card_code, :string
  	add_column :cardinfos, :card_number, :string
  	add_column :cardinfos, :charge_id, :string
  	add_column :cardinfos, :token, :string
  	add_column :cardinfos, :user_id, :integer
  	add_column :cardinfos, :plan_id, :integer
  end
end
