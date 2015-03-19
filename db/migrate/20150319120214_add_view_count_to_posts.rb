class AddViewCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :pvcount, :integer
  end
end
