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
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
