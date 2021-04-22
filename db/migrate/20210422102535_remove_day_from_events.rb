class RemoveDayFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :day
  end
end
