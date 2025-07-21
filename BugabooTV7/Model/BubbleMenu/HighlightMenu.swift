
import Foundation

// MARK: - HighlightMenu
struct HighlightMenu: Codable {
    let statusCode: Int
    let message: String
    let data: DataShow
}

// MARK: - DataClass
struct DataShow: Codable {
    let mainMenuItem: [MainMenuItem]
    let coverPage: CoverPage
    let isPersonalized: Bool
    let total: Int

    enum CodingKeys: String, CodingKey {
        case mainMenuItem = "main_menu_item"
        case coverPage
        case isPersonalized = "is_personalized"
        case total
    }
}

// MARK: - CoverPage
struct CoverPage: Codable {
    let enable: Bool
    let styles: JSONNull?
}

// MARK: - MainMenuItem
struct MainMenuItem: Codable {
    let menuID, title, contentID, description: String
    let section: String
    let imageURL: ImageURL
    let linkURL: String
    let showPremiumBadge: Bool

    enum CodingKeys: String, CodingKey {
        case menuID = "menu_id"
        case title
        case contentID = "content_id"
        case description, section
        case imageURL = "image_url"
        case linkURL = "link_url"
        case showPremiumBadge = "show_premium_badge"
    }
}

// MARK: - ImageURL
struct ImageURL: Codable {
    let small, medium, large: String
    let seoShare, original, eventHighlightBanner: JSONNull?
}
