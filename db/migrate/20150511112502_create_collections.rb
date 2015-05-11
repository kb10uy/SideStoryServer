class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :name
      t.text :description
      t.boolean :private
      t.text :posts_list

      t.timestamps null: false
    end
  end
end
