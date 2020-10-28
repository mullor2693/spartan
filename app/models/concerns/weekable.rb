module Weekable extend ActiveSupport::Concern

    WEEKDAYS = (1..7).collect {|weekday| [Date::DAYNAMES[weekday%7], weekday ] }

    def name_weekday(weekday)
        Date::DAYNAMES[weekday.to_i%7]
    end

    def list_weekdays
        list = []
        weekdays.each do |weekday|
            list << name_weekday(weekday)
        end
        return list
    end

    def weekdays_sentence
        list_weekdays.to_sentence
    end

    private

    def clean_weekdays
        weekdays.delete("")
    end

end
