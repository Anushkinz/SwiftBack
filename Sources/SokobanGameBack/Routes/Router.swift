import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import Foundation

func setupRouter() -> Routes {
    var routes = Routes()
        
    routes.add(method: .get, uri: "/Levels") { request, response in
        LevelController().handleLevelsRequest(request: request, response: response)
    }
    
    routes.add(method: .get, uri: "/levels/{level}") { request, respone in
        LevelController().handleLevelRequestById(request: request, response: respone)
    }
        
    return routes
}
