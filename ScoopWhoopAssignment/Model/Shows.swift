//
//  Show.swift
//  ScoopWhoopAssignment
//
//  Created by Harshit Jain on 22/06/21.
//

import UIKit

struct Show {
    
    internal init(name: String, imageURL: String) {
        self.name = name
        self.imageURL = imageURL
    }

    var name: String
    var imageURL: String
    var nameSlug: String?
    var topicDesc: String?
}

var shows=[Show]()

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

// MARK: - Welcome
struct ShowsResponse: Decodable {
    let status, nextOffset, totalShows: Int
    let data: [ShowResponse]
    let err: String

    enum CodingKeys: String, CodingKey {
        case status
        case nextOffset = "next_offset"
        case totalShows = "total_shows"
        case data, err
    }
}

// MARK: - Show
struct ShowResponse: Decodable {
    let featureImgPort: String
    let topicName: String
    let topicSlug: String
    let topicDesc: String
//    let topicFeatureImg: String
//    let topicFeatureVideo: String
//    let modifiedDate: String
//    let propertyTags: [PropertyTag]
//    let userID: String
//    let priority: Int
//    let lastVideoPubEpochDate: String
//    let featureImgLand, onexoneImg: String
//    let channel: Channel
//    let updatedBy: String
//    let tags: [String]
//    let totalVideos, flag: Int
//    let redisID: String
//    let topicType: [String]
//    let createdDate, id: String
//
    enum CodingKeys: String, CodingKey {
        case featureImgPort = "feature_img_port"
        case topicName = "topic_name"
        case topicSlug = "topic_slug"
        case topicDesc = "topic_desc"

//        case topicFeatureImg = "topic_feature_img"
//        case topicFeatureVideo = "topic_feature_video"
//        case modifiedDate = "modified_date"
//        case propertyTags = "property_tags"
//        case userID, priority
//        case lastVideoPubEpochDate = "last_video_pub_epoch_date"
//        case featureImgLand = "feature_img_land"
//        case onexoneImg = "onexone_img"
//        case channel
//        case updatedBy = "updated_by"
//        case tags
//        case totalVideos = "total_videos"
//        case flag
//        case redisID = "redis_id"
//        case topicType = "topic_type"
//        case createdDate = "created_date"
//        case id = "_id"
    }
}

// MARK: - Channel
//struct Channel: Codable {
//    let name, slug: String
//}

// MARK: - PropertyTag
//struct PropertyTag: Codable {
//    let propertyTagDescription: String
//    let show: Bool
//    let title, tag: String
//    let featureImg: String
//    let order: Int
//    let tags: [String]
//
//    enum CodingKeys: String, CodingKey {
//        case propertyTagDescription = "description"
//        case show, title, tag
//        case featureImg = "feature_img"
//        case order, tags
//    }
//}



