require "date"
class Calendar_prep

  def self.unavailable_dates(bookings, availability)
    booked_dates = []
    bookings.each do |booking|
      booked_dates += booking.dates
    end
    booked_dates += availability.unavailable_days
    booked_dates.select! { |x| x >= availability.min_date and x <= availability.max_date}
    booked_dates.sort!
    p availability.min_date
    p availability.max_date
    booked_dates = booked_dates.uniq
    unavailable_string_array = booked_dates.map { |date| date.to_s }
    return unavailable_string_array.join(',')
  end
end
