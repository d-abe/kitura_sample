//
// Created by Daijiro Abe on 2016/02/26.
//

import KituraRouter
import KituraNet
import SwiftyJSON

class ArticleController {

    static let getAll : RouterHandler = {
        request, response, next in

        let json = JSON(Article.findAll().toJSON())
        response.status(HttpStatusCode.OK).sendJson(json)

        next()
    }

}
