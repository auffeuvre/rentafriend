class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[ show edit update destroy show_myactivities ]

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
    @activities = Activity.where("(description ILIKE ? OR title ILIKE ?) ", "%#{@search}%", "%#{@search}%").and(Activity.where.not(user_id: current_user))
    if params[:at]
      @at = params[:at]
      @km = params[:km] if params[:km]
      @activities = @activities.near(@at, @km) unless params[:at].empty?
    end

    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {activity: activity})
      }
    end
  end

  def show
    @booking = Booking.new
    @markers = [{
      lat: @activity.latitude,
      lng: @activity.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: {activity: @activity})
    }] if @activity.geocoded?
  end

  def edit
    unless current_user == @activity.user
      redirect_to user_path(current_user), notice: "You can't modify other's activities."
    end
  end

  def update
    if @activity.update(params_activity)
      redirect_to activity_path(@activity), notice: "Activity was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    redirect_to user_path(current_user), notice: "You can't destroy other's activities."
    @activity.destroy
    redirect_to activities_path, notice: "Activity was successfully destroyed."
  end

  def myactivities
    @activities = Activity.where(user_id: current_user)
    @bookings_to_validate = []
    @activities.each do |activity|
      @bookings_to_validate << activity.bookings.select { |booking| booking.validation.nil? }
    end
    @bookings_to_validate.flatten
    @bookings_incoming = []
    @activities.each do |activity|
      @bookings_incoming << activity.bookings.select { |booking| booking.validation == true && booking.date >= Date.today() }
    end
    @bookings_incoming.flatten
  end

  def show_myactivities
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def params_activity
    params.require(:activity).permit(:title, :description, :location, :poster_url, :photo)
  end
end
