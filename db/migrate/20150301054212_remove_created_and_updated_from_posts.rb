class RemoveCreatedAndUpdatedFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :updated, :string
    remove_column :posts, :created, :string
  end
end
