//
// Created by Daijiro Abe on 2016/02/26.
//

import KituraRouter
import LoggerAPI

class HeaderFilter : RouterMiddleware {

    func handle(request: RouterRequest, response: RouterResponse, next: () -> Void) {

        Log.info("Added cross origin header")

        response.setHeader("Access-Control-Allow-Origin", value: "*")

        response.setHeader("Access-Control-Allow-Headers", value: "accept, content-type")
        response.setHeader("Access-Control-Allow-Methods", value: "GET,HEAD,POST,DELETE,OPTIONS,PUT")

        next()
    }

}
