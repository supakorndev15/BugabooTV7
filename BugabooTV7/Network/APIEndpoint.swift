
import Foundation

enum APIEndpoint: String {
    case liveChannels = "/v1/live/channels"
    case highlightMenu = "/v1/navigation/highlight-menu"

    func url(personalized: Bool = false) -> String {
        return "https://bff-web-api.bugaboo.tv/bff-web" + self.rawValue + "?personalized=\(personalized)"
    }
}
