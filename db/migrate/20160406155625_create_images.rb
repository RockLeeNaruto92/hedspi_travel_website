class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.integer :owner_id
      t.string :owner_type

      t.timestamps null: false
    end
  end
end
