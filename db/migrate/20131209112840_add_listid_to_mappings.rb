class AddListidToMappings < ActiveRecord::Migration
  def change
  	add_column :mappings,:list_id, :string
  end
end
