class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[ show edit update destroy ]

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(params_activity)
    @activity.user_id = current_user.id
    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @search = params[:query] if params[:query]
    @activities = Activity.where("(location ILIKE ? OR description ILIKE ? OR title ILIKE ?) ", "%#{@search}%", "%#{@search}%", "%#{@search}%").and(Activity.where.not(user_id: current_user))
  end

  def show
  end

  def edit
  end

  def update
    if @activity.update(params_activity)
      redirect_to activity_path(@activity), notice: "Activity was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @activity.destroy
    redirect_to activities_path, notice: "Activity was successfully destroyed."
  end

  def myactivities
    @activities = Activity.where(user_id: current_user)
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def params_activity
    params.require(:activity).permit(:title, :description, :location, :poster_url)
  end
end
