class AddNiceCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :nicecount, :integer
  end
end
