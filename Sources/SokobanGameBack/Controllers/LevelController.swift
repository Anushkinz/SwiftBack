import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

class LevelController {

    func handleLevelsRequest(request: HTTPRequest, response: HTTPResponse) {
        do {
            try response.setBody(json: getLevel())
                .setHeader(.contentType, value: "application/json")
                .completed(status: .ok)
        } catch {
            response.setBody(string: "Something went wrong")
                .completed(status: .internalServerError)
        }
    }
    
    func handleLevelRequestById(request: HTTPRequest, response: HTTPResponse) {
            do {
                guard let levelId: Int = Int(request.urlVariables["level"] ?? "") else {
                    response.setBody(string: "Level id is missing")
                        .completed(status: .badRequest)
                    return
                }
                
                let level = getLevel().filter { details in
                    if let id = details["level"] as? Int {
                        return id == levelId
                    }
                    return false
                }
                
                try response.setBody(json: level)
                    .setHeader(.contentType, value: "application/json")
                    .completed(status: .ok)
            } catch {
                response.setBody(string: "Something went wrong")
                    .completed(status: .internalServerError)
            }
        }
}

