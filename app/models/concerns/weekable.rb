module Weekable extend ActiveSupport::Concern

    WEEKDAYS = (1..7).collect {|weekday| [I18n.t('date.day_names')[weekday%7].capitalize, weekday ] }

    def name_weekday(weekday)
        I18n.t('date.day_names')[weekday.to_i%7].capitalize
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
