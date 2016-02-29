//
// Created by Daijiro Abe on 2016/02/26.
//

import Foundation
import Fluent
import LoggerAPI

class Article : Model {

    var id: String?
    var comment: String
    var createdAt: NSDate?

    init(comment: String) {
        self.comment = comment
        self.createdAt = NSDate()
    }

    init(comment: String, createdAt: NSDate) {
        self.comment = comment
        self.createdAt = createdAt
    }
    init(comment: String, createdAtStr: String) {
        self.comment = comment
        self.createdAt = dateFromString(createdAtStr)
    }

    func serialize() -> [String:String] {
        var createdAtStr : String? = ""

        if let createdAt = self.createdAt {
            createdAtStr = stringFromDate(createdAt)
        }

        return [
            "comment": self.comment,
            "created_at": createdAtStr!
        ]
    }

    class var table: String {
        return "article"
    }

    required init(serialized: [String:String]) {
        self.id = serialized["id"]
        self.comment = serialized["comment"] ?? ""
        if let created_at = serialized["created_at"] {
            self.createdAt = dateFromString(created_at)
        }
        else {
            self.createdAt = nil
        }
    }

    static func findAll() -> Articles {
        return Articles(array: Query().results)
    }
}

class Articles {
    var articles : [Article]

    init(array: [Article]) {
        self.articles = array
    }

    func get() -> [Article] {
        return articles
    }

    func toJSON() -> [[String:String]] {
        return articles.map { $0.serialize() }
    }
}