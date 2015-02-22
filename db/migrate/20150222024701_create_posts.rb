class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :userid
      t.string :title
      t.text :content
      t.datetime :posted
      t.datetime :updated

      t.timestamps null: false
    end
  end
end
