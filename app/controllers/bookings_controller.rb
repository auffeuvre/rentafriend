class BookingsController < ApplicationController
  before_action :set_activity, only: %i[ new, create ]


  def create
    @booking = Booking.new(params_booking)
    @booking.user_id = current_user.id
    @booking.activity_id = @activity.id
    if @booking.save
      redirect_to mybookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def mybookings
    @bookings = Booking.where(user_id: current_user)
  end

  def update
    @response = params[:response]
    @activity = Activity.find(params[:activity_id])
    Booking.find(params[:id]).update(validation: @response)
    redirect_to myactivities_path, notice: "Booking was successfully validated."
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def params_booking
    params.require(:booking).permit(:date)
  end
end
