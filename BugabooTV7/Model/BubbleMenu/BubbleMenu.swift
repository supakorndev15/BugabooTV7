
// MARK: - BubbleMenu
import Foundation

struct BubbleMenuResponse: Codable {
    let statusCode: Int
    let message: String
    let data: BubbleData
}

struct BubbleData: Codable {
    let menu: [Menu]
    let isPersonalized: Bool
    let total: Int

    enum CodingKeys: String, CodingKey {
        case menu
        case isPersonalized = "is_personalized"
        case total
    }
}

struct Menu: Codable {
    let label: String
    let targetURL: String
    let iconKey: String
    let iconURL: String
    let showIcon: Bool

    enum CodingKeys: String, CodingKey {
        case label
        case targetURL = "target_url"
        case iconKey = "icon_key"
        case iconURL = "icon_url"
        case showIcon = "show_icon"
    }
}

