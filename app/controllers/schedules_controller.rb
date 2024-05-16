class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    @total_schedules = @schedules.count
  end

  def new
    @schedule = Schedule.new
    end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo))
    @schedule.all_day = params[:schedule][:all_day] == '1'
      if @schedule.save
        flash[:notice] = "スケジュールを追加しました"
        redirect_to :schedules
      else
        render "new"
      end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    @schedule.all_day = params[:schedule][:all_day] == '1'
      if @schedule.update(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo))
        flash[:notice] = "スケジュールを編集しました"
        redirect_to :schedules
      else
        render "edit"
      end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :schedules
  end
end
