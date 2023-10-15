# Write your code for the 'Meetup' exercise in this file. Make the tests in
# `meetup_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/meetup` directory.

require 'Date'

# Meetup Class determines the dates of meetings
class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(day_of_week, descriptor)
    first_occurance = get_first_occurance(day_of_week)

    # handle descriptors
    case descriptor
    when :first then first_occurance
    when :second then first_occurance + 7
    when :third then first_occurance + 14
    when :fourth then first_occurance + 21
    when :last
      # Aim high and work backwards until the months are the same
      if (first_occurance + 28).mon == first_occurance.mon
        first_occurance + 28
      elsif (first_occurance + 21).mon == first_occurance.mon
        first_occurance + 21
      else
        first_occurance + 14
      end
    when :teenth
      # Test the sencond and third occurance of the day
      (1..2).each do |counter|
        loop_day_of_week = first_occurance + (counter * 7)
        return first_occurance + (counter * 7) if loop_day_of_week.day >= 13
      end
    end
  end

  private

  def get_first_occurance(day_of_week)
    # Day of week to number
    day_number = nil
    case day_of_week
    when :monday then day_number = 1
    when :tuesday then day_number = 2
    when :wednesday then day_number = 3
    when :thursday then day_number = 4
    when :friday then day_number = 5
    when :saturday then day_number = 6
    when :sunday then day_number = 7
    end

    # Get the first of the month
    first_of_month = Date.new(@year, @month, 1)

    # Find first occurance of day_of_week
    first_occurance = nil
    7.times do |counter|
      first_occurance = first_of_month + counter if (first_of_month + counter).cwday == day_number
    end
    first_occurance
  end
end
