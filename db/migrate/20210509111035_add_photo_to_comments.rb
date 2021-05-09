class AddPhotoToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :photo, :string
  end
end
