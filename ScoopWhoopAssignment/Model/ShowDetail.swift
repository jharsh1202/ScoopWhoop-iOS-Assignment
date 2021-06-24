//
//  ShowDetail.swift
//  ScoopWhoopAssignment
//
//  Created by Harshit Jain on 24/06/21.
//

import Foundation

struct ShowDetail {
  
    var name: String
    var featureImageLand: String
    var featureImg: String
    var titles: [String]
    var thumbnails: [String]
    var desc: String
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

// MARK: - ShowDetailResponse
struct ShowDetailResponse: Codable {
    let status: Int
    let showDetails: ShowDetails
    let nextOffset: Int
    let data: [ShowDetailData]
    let err: String

    enum CodingKeys: String, CodingKey {
        case status
        case showDetails = "show_details"
        case nextOffset = "next_offset"
        case data, err
    }
}

// MARK: - Datum
struct ShowDetailData: Codable {
    //let castCrew: [JSONAny]
    //let shHeading
    let title: String
    let newTags: [NewTag]
    //let onexoneImg: String
    //let show: ShowData
    //let genres: [Genre]
    //let videoThumbnail2X3: String
    //let aspectRatio: AspectRatio
    //let nsfw: Int
    let featureImg: String
    //let videoThumbnail16X9: String
    //let duration: String
    //let premium: Bool
    //let id, pubDate, slug: String
    //let tags: [String]
    //let videoThumbnail9X16: String

    enum CodingKeys: String, CodingKey {
        //case castCrew = "cast_crew"
//        case shHeading = "sh_heading"
        case title
        case newTags = "new_tags"
//        case onexoneImg = "onexone_img"
//        case show, genres
//        case videoThumbnail2X3 = "video_thumbnail_2x3"
//        case aspectRatio = "aspect_ratio"
//        case nsfw
        case featureImg = "feature_img"
//        case videoThumbnail16X9 = "video_thumbnail_16x9"
//        case duration, premium
//        case id = "_id"
//        case pubDate = "pub_date"
//        case slug, tags
//        case videoThumbnail9X16 = "video_thumbnail_9x16"
    }
}

enum AspectRatio: String, Codable {
    case the169 = "16:9"
}

// MARK: - Genre
struct Genre: Codable {
    let genreTitle, genreSlug: String

    enum CodingKeys: String, CodingKey {
        case genreTitle = "genre_title"
        case genreSlug = "genre_slug"
    }
}

// MARK: - NewTag
struct NewTag: Codable {
    let id: String
    let flag: Int
    let title, tagSlug, tagType: String

    enum CodingKeys: String, CodingKey {
        case id, flag, title
        case tagSlug = "tag_slug"
        case tagType = "tag_type"
    }
}

// MARK: - Show
struct ShowData: Codable {
    let topic: String
    let featureImgPort, topicFeatureImg, featureImgLand: String
    //let topicDisplay: TopicDisplay

    enum CodingKeys: String, CodingKey {
        case topic
        case featureImgPort = "feature_img_port"
        case topicFeatureImg = "topic_feature_img"
        case featureImgLand = "feature_img_land"
        //case topicDisplay = "topic_display"
    }
}

// MARK: - TopicDisplay
struct TopicDisplay: Codable {
    let topicSlug: String
    let topicDisplay: String

    enum CodingKeys: String, CodingKey {
        case topicSlug = "topic_slug"
        case topicDisplay = "topic_display"
    }
}
//
//enum TopicSlug: String, Codable {
//    case streetView = "Street-View"
//}

// MARK: - ShowDetails
struct ShowDetails: Codable {
    //let featureImgPort: String
    let topicName: String
    let totalVideos: Int
    let topicDesc: String
    let topicSlug: String
    let featureImgLand: String
    //let onexoneImg: String
    //let channel: Channel

    enum CodingKeys: String, CodingKey {
        //case featureImgPort = "feature_img_port"
        case topicName = "topic_name"
        case totalVideos = "total_videos"
        case topicDesc = "topic_desc"
        case topicSlug = "topic_slug"
        case featureImgLand = "feature_img_land"
        //case onexoneImg = "onexone_img"
        //case channel
    }
}

// MARK: - Channel
struct Channel: Codable {
    let name, slug: String
}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
//
//class JSONCodingKey: CodingKey {
//    let key: String
//
//    required init?(intValue: Int) {
//        return nil
//    }
//
//    required init?(stringValue: String) {
//        key = stringValue
//    }
//
//    var intValue: Int? {
//        return nil
//    }
//
//    var stringValue: String {
//        return key
//    }
//}
//
//class JSONAny: Codable {
//
//    let value: Any
//
//    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
//        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
//        return DecodingError.typeMismatch(JSONAny.self, context)
//    }
//
//    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
//        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
//        return EncodingError.invalidValue(value, context)
//    }
//
//    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if container.decodeNil() {
//            return JSONNull()
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if let value = try? container.decodeNil() {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer() {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
//        if let value = try? container.decode(Bool.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Double.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(String.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decodeNil(forKey: key) {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
//        var arr: [Any] = []
//        while !container.isAtEnd {
//            let value = try decode(from: &container)
//            arr.append(value)
//        }
//        return arr
//    }
//
//    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
//        var dict = [String: Any]()
//        for key in container.allKeys {
//            let value = try decode(from: &container, forKey: key)
//            dict[key.stringValue] = value
//        }
//        return dict
//    }
//
//    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
//        for value in array {
//            if let value = value as? Bool {
//                try container.encode(value)
//            } else if let value = value as? Int64 {
//                try container.encode(value)
//            } else if let value = value as? Double {
//                try container.encode(value)
//            } else if let value = value as? String {
//                try container.encode(value)
//            } else if value is JSONNull {
//                try container.encodeNil()
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer()
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
//        for (key, value) in dictionary {
//            let key = JSONCodingKey(stringValue: key)!
//            if let value = value as? Bool {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Int64 {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Double {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? String {
//                try container.encode(value, forKey: key)
//            } else if value is JSONNull {
//                try container.encodeNil(forKey: key)
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer(forKey: key)
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
//        if let value = value as? Bool {
//            try container.encode(value)
//        } else if let value = value as? Int64 {
//            try container.encode(value)
//        } else if let value = value as? Double {
//            try container.encode(value)
//        } else if let value = value as? String {
//            try container.encode(value)
//        } else if value is JSONNull {
//            try container.encodeNil()
//        } else {
//            throw encodingError(forValue: value, codingPath: container.codingPath)
//        }
//    }
//
//    public required init(from decoder: Decoder) throws {
//        if var arrayContainer = try? decoder.unkeyedContainer() {
//            self.value = try JSONAny.decodeArray(from: &arrayContainer)
//        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
//            self.value = try JSONAny.decodeDictionary(from: &container)
//        } else {
//            let container = try decoder.singleValueContainer()
//            self.value = try JSONAny.decode(from: container)
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        if let arr = self.value as? [Any] {
//            var container = encoder.unkeyedContainer()
//            try JSONAny.encode(to: &container, array: arr)
//        } else if let dict = self.value as? [String: Any] {
//            var container = encoder.container(keyedBy: JSONCodingKey.self)
//            try JSONAny.encode(to: &container, dictionary: dict)
//        } else {
//            var container = encoder.singleValueContainer()
//            try JSONAny.encode(to: &container, value: self.value)
//        }
//    }
//}
