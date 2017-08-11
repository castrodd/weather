module ApplicationHelper
    def farenheit(kelvins)
      (kelvins * (9.0/5)) - 459.67
    end

    def celsius(kelvins)
      kelvins - 273.15
    end
end
