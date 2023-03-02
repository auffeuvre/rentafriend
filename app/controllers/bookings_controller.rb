class BookingsController < ApplicationController
  before_action :set_activity, only: %i[ new, create  ]


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
    @bookings = Booking.where(user_id: current_user).sort_by{|book| book.date}.group_by {|booking| Date::MONTHNAMES[booking.date.month].upcase.first(3)}
  end

  def update
    @response = params[:response]
    @activity = Activity.find(params[:activity_id])
    Booking.find(params[:id]).update(validation: @response)
    redirect_to myactivities_path, notice: "Booking was successfully validated."
  end

  def show
    @booking = Booking.find(params[:id])
    @message = Message.new
    @messages = Message.where(booking: @booking)
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def params_booking
    params.require(:booking).permit(:date)
  end
end
