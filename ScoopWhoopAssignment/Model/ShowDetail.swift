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
    let title: String
    let newTags: [NewTag]
    let featureImg: String

    enum CodingKeys: String, CodingKey {
        case title
        case newTags = "new_tags"
        case featureImg = "feature_img"
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
    
    enum CodingKeys: String, CodingKey {
        case topic
        case featureImgPort = "feature_img_port"
        case topicFeatureImg = "topic_feature_img"
        case featureImgLand = "feature_img_land"
        //case topicDisplay = "topic_display"
    }
}

// MARK: - ShowDetails
struct ShowDetails: Codable {
    let topicName: String
    let totalVideos: Int
    let topicDesc: String
    let topicSlug: String
    let featureImgLand: String

    enum CodingKeys: String, CodingKey {
        case topicName = "topic_name"
        case totalVideos = "total_videos"
        case topicDesc = "topic_desc"
        case topicSlug = "topic_slug"
        case featureImgLand = "feature_img_land"
    }
}
