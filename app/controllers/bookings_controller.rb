class BookingsController < ApplicationController
  before_action :set_activity, only: %i[ new, create  ]

  def new
    @booking = Booking.new
    @activity = Activity.find(params[:activity_id])
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.user_id = current_user.id
    @booking.activity_id = @activity.id
    if @booking.save
      redirect_to activity_path(@activity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def mybookings
    @bookings = Booking.where(user_id: current_user)
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def params_booking
    params.require(:booking).permit(:date)
  end
end
