class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.text :body, null: false
      t.boolean :private, default: false

      t.timestamps
    end
  end
end
