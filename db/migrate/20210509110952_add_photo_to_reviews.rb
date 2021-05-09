class AddPhotoToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :photo, :string
  end
end
