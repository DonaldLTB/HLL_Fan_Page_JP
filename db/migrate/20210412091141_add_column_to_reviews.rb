class AddColumnToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :topic, :string
  end
end
