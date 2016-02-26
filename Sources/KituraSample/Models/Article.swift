//
// Created by Daijiro Abe on 2016/02/26.
//

import Foundation
import Fluent

class Article : Model {

    var id: String?
    var comment: String
    var createdAt: String

    init(comment: String, createdAt: String) {
        self.comment = comment
        self.createdAt = createdAt
    }

    func serialize() -> [String:String] {
        return [
            "comment": self.comment,
            "created_at": self.createdAt
        ]
    }

    class var table: String {
        return "article"
    }

    required init(serialized: [String:String]) {
        self.id = serialized["id"]
        self.comment = serialized["comment"] ?? ""
        self.createdAt = serialized["created_at"] ?? ""
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