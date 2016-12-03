class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :title, length: 4..40, null: false
      t.string :url, null: false

      t.timestamps
    end
    add_index :lists, :url
  end
end
