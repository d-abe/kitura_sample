//
// Created by Daijiro Abe on 2016/02/29.
//

import Foundation
import Fluent
import LoggerAPI

extension Model {
    var dateFormatter : NSDateFormatter {
        let dateFormatter : NSDateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name: "Asia/Tokyo")!
        return dateFormatter
    }

    func stringFromDate(date: NSDate) -> String? {
        return dateFormatter.stringFromDate(date)
    }

    func dateFromString(dateStr: String) -> NSDate? {
        return dateFormatter.dateFromString(dateStr)
    }

    func stringFromInt(num: Int) -> String {
        return String(format: "%d", num)
    }

    func intFromString(numStr: String) -> Int? {
        return Int(numStr, radix:10)
    }
}