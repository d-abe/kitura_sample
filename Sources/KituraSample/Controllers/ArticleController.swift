//
// Created by Daijiro Abe on 2016/02/26.
//

import KituraRouter
import KituraNet
import SwiftyJSON
import LoggerAPI

class ArticleController {

    static let getAll : RouterHandler = {
        request, response, next in

        let json = JSON(Article.findAll().toJSON())
        response.status(HttpStatusCode.OK).sendJson(json)

        next()
    }

    static let add : RouterHandler = {
        request, response, next in

        if let body = request.body {

            if let json = body.asJson() {

                let comment = json["comment"].stringValue
                let createdAt = json["createdAt"].stringValue

                let article = Article(comment: comment, createdAt: createdAt)
                article.save()

                let result = JSON(article.serialize())

                response.status(HttpStatusCode.OK).sendJson(result)

            }
        } else {
            Log.warning("No body")
            response.status(HttpStatusCode.BAD_REQUEST)
        }

    }
}
