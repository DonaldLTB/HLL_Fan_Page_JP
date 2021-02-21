class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :reviewer, null: false, foreign_key: { to_table: :users }
      # might need following
      # class RemoveReviewerIdFromReviews < ActiveRecord::Migration[6.0]
      #   def change
      #     remove_column :reviews, :reviewer_id, :bigint
      #   end
      # end
      t.timestamps
    end
  end
end
