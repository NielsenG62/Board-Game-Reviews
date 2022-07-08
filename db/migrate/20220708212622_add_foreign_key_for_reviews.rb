class AddForeignKeyForReviews < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :reviews, :games
  end
end

