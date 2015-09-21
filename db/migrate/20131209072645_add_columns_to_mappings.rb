class AddColumnsToMappings < ActiveRecord::Migration
  def change
  	  
  	add_column :mappings,:list, :string
  	add_column :mappings,:order_number, :string
  	add_column :mappings,:seller_id, :string
  	add_column :mappings,:product_id, :string
  	add_column :mappings,:product_permalink, :string
  	add_column :mappings,:email, :string
  	add_column :mappings,:full_name, :string
   	add_column :mappings,:price, :string
  	add_column :mappings,:variants, :string
  	add_column :mappings,:offer_code, :string
  	add_column :mappings,:test, :string
  	add_column :mappings,:custom_fields, :string
  	add_column :mappings,:shipping_information, :string
  	add_column :mappings,:is_recurring_charge, :string
  	add_column :mappings,:user_id, :integer
  	add_column :mappings,:is_preorder_authorization, :string
  end
end
