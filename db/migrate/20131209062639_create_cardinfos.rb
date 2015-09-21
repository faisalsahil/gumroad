class CreateCardinfos < ActiveRecord::Migration
  def change
    create_table :cardinfos do |t|

      t.timestamps
    end
  end
end
