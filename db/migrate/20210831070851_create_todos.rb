class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.references :user, null: false, foreign_key: true
      t.string :content, null: false, default: ""
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
