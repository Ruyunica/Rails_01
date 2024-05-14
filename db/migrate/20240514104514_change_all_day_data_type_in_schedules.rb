class ChangeAllDayDataTypeInSchedules < ActiveRecord::Migration[6.1]
  def change
    change_column :schedules, :all_day, :boolean
  end
end
