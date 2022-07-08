class RenameCommentsToReviews < ActiveRecord::Migration[5.2]
  def change
    rename_table :comments, :reviews
  end
end
