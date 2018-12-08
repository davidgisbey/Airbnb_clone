require "date"
class Calendar_prep

  def self.unavailable_dates(bookings, availability)
    booked_dates = []
    bookings.each do |booking|
      booked_dates += booking.dates
    end
    booked_dates += availability.unavailable_days
    booked_dates.sort!
    unavailable_string_array = booked_dates.map { |date| date.to_s }
    unavailable_string_array.join(', ')
  end

  def self.available_dates_disabled(availability)
    unavailable_string_array = availability.dates.map { |date| date.to_s }
    unavailable_string_array.join(', ')
  end
end
