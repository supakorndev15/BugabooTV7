//
//  LiveChannelsModel.swift
//  BugabooTV7
//
//  Created by MacDetail on 19/7/2568 BE.
//

import Foundation

struct LiveChannelsModel: Codable {
    let statusCode: Int
    let message: String
    let data: DataClass
}

struct DataClass: Codable {
    let channels: [Channel]
    let total: Int
    let geoBlock: Bool
}

struct Channel: Codable {
    let channelID, channelName: String
    let thumbnailURL: String
    let streamID, vcID: String
    let scheduleURL: String
    let defaultChannel: Bool
    let status: String
    let images: Images
    let imgType: String

    enum CodingKeys: String, CodingKey {
        case channelID = "channel_id"
        case channelName = "channel_name"
        case thumbnailURL = "thumbnail_url"
        case streamID = "stream_id"
        case vcID = "vc_id"
        case scheduleURL = "schedule_url"
        case defaultChannel = "default_channel"
        case status, images, imgType
    }
}

struct Images: Codable {
    let portrait, landscape, square: Landscape
    let background: Background
    let fallbackURL: String

    enum CodingKeys: String, CodingKey {
        case portrait, landscape, square, background
        case fallbackURL = "fallback_url"
    }
}

struct Background: Codable {
    let small, medium, large: String
}

struct Landscape: Codable {
    let small, medium, large: String
    let seoShare, original, eventHighlightBanner: JSONNull?
}

class JSONNull: Codable, Hashable {
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool { true }
    public var hashValue: Int { 0 }
    public init() {}
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self,
                DecodingError.Context(codingPath: decoder.codingPath,
                                      debugDescription: "Wrong type for JSONNull"))
        }
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
