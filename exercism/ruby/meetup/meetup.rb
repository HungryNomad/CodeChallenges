# Write your code for the 'Meetup' exercise in this file. Make the tests in
# `meetup_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/meetup` directory.

require 'date'

# Meetup Class determines the dates of meetings
class Meetup
  # constructor
  def initialize(month, year)
    @month = month
    @year = year
  end

  # get meeting date
  def day(day_of_week, descriptor)
    # Get all occurances of xday of the week in @month @year
    all_occurances = get_all_occurances(day_of_week)

    # Return the 2nd or 3rd week
    if descriptor == :teenth
      all_occurances[1..2].each do |test_day|
        return test_day if test_day.day >= 13
      end
    end

    # Everything else
    index = { first: 0, second: 1, third: 2, fourth: 3, last: -1 }
    all_occurances[index[descriptor]]
  end

  private

  def get_first_occurance(day_of_week)
    # Get the first of the month
    first_of_month = Date.new(@year, @month, 1)

    # Find first occurance of day_of_week. Try from the the 1st to the 7th
    first_occurance = nil
    7.times do |counter|
      first_occurance = first_of_month + counter if (first_of_month + counter).send("#{day_of_week}?")
    end
    first_occurance
  end

  def get_all_occurances(day_of_week)
    first_occurance = get_first_occurance(day_of_week)
    all_occurances = []
    5.times do |week_num|
      # Verify that it hasn't rolled into the next month
      if (first_occurance + (7 * week_num)).mon == first_occurance.mon
        all_occurances << (first_occurance + (7 * week_num))
      end
    end
    all_occurances
  end
end
