import KituraNet
import KituraSys
import LithiumLogger
import LoggerAPI

let router = MyRouter()

Log.logger = LithimLogger(logLevel: .Debug)

let server = HttpServer.listen(8090, delegate: router)
Server.run()
