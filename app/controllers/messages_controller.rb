class MessagesController < ApplicationController
  def show
    @messages = Message.where(booking: @booking)
  end

  def create
    @message = Message.new(content: params["message"]["content"])
    @message.booking = Booking.find(params[:booking_id])
    @message.sender = current_user.id
    @message.save
  end
end
