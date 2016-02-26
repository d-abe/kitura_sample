//
// Created by Daijiro Abe on 2016/02/26.
//

import KituraRouter

class MyRouter : Router {

    override init() {

        super.init()

        self.use("/*", middleware: BodyParser())
        self.use("/*", middleware: HeaderFilter())
        self.use("/*", middleware: FluentFilter())

        self.all("/") {
            _, _, next in

            next()
        }

        ///
        /// Get all articles
        ///
        self.get("/", handler: ArticleController.getAll)

        ///
        /// Add article
        ///
        self.post("/", handler: ArticleController.add)
    }

}
