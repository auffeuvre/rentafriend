class AddValidateToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :validation, :boolean
  end
end
