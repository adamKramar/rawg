// All rights reserved. Copyright © 2024 Adam Kramár.  

import Foundation

public enum DateFormatters {
    public static let dayMonthYearDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter
    }()

    public static let rawgApiDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    public static func convertFromApiDate(apiDate: String) -> String? {
        let apiFormater = DateFormatters.rawgApiDateFormatter
        guard let dateFromString = apiFormater.date(from: apiDate) else {
            return nil
        }

        let dayMonthYear = DateFormatters.dayMonthYearDateFormatter
        let stringFromDate = dayMonthYear.string(from: dateFromString)

        return stringFromDate
    }

    public static func convertToApiDateString(date: Date) -> String {
        let apiFormater = DateFormatters.rawgApiDateFormatter
        return apiFormater.string(from: date)
    }
}
