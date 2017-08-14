class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string   "title"
      t.text     "body"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
