//
// Created by Daijiro Abe on 2016/02/26.
//

import KituraRouter
import Fluent
import PostgreSQLDriver

class FluentFilter : RouterMiddleware {

    func handle(request: RouterRequest, response: RouterResponse, next: () -> Void) {

        Database.driver = PostgreSQLDriver(connectionInfo: Constants.DB_CONN_INFO)

        next()
    }


}
