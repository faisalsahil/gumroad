class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :ping_count
      t.string :ping_charges

      t.timestamps
    end
  end
end
