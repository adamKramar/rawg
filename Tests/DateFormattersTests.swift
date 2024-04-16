// All rights reserved. Copyright © 2024 Adam Kramár.  

import XCTest
@testable import rawg

final class DateFormattersTests: XCTestCase {
    func testConvertFromApiDateToDatMontYear() {
        let apiDateString = "2024-02-26"
        let convertedDateString = DateFormatters.convertFromApiDate(apiDate: apiDateString)

        XCTAssertEqual(convertedDateString, "26.02.2024")
    }

    func testConvertToApiDateString() {
        let date = Date.now
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        XCTAssertEqual(formatter.string(from: date), DateFormatters.convertToApiDateString(date: date))
    }
}
