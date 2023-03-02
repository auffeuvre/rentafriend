class MessagesController < ApplicationController
  def show
    @room = Room.find(params[:single_room])
    @messages = Message.where(booking: @booking)
  end

  def create
    @message = Message.new(content: params["message"]["content"])
    @message.booking = Booking.find(params[:booking_id])
    @message.save
  end
end
