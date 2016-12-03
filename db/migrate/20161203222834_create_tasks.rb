class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :type, null: false
      t.text :description, length: 4..500, null: false
      t.datetime :beginning, null: false
      t.datetime :ending, null: false
      t.float :percentaje, null: false
      t.belongs_to :list
      t.belongs_to :status
      t.belongs_to :priority

      t.timestamps
    end
  end
end
