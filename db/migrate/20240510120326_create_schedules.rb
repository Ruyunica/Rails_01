class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.string :all_day
      t.string :memo

      t.timestamps
    end
  end
end