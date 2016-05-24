class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :titulo
      t.string :texto
      t.integer :curtidas
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
