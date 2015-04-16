class AddBadcountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :badcount, :integer
  end
end
