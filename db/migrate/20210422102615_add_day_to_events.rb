class AddDayToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :day, :date
  end
end
