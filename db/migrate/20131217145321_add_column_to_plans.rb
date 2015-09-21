class AddColumnToPlans < ActiveRecord::Migration
  def change
  	add_column :plans,:interval, :string
  	add_column :plans,:unique_id, :string
  end
end
