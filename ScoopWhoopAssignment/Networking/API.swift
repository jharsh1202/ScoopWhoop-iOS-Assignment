//
//  API.swift
//  ScoopWhoopAssignment
//
//  Created by Harshit Jain on 23/06/21.
//

import UIKit

class API {
    
    // MARK: - Retrieve All Shows
    static func getAllShows (from url : String, completion: @escaping ([Show]) -> Void) {
        var showsData = [Show]()
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            var result: ShowsResponse?
            guard let data=data, error == nil else {
                return
            }
            do {
                try result = JSONDecoder().decode(ShowsResponse.self, from: data)
            } catch {
                print("didnt't work out to convert json to your structure")
            }
            if let showData = result?.data {
                for mshow in showData {
                    let showimageURL = mshow.featureImgPort
                    let showName = mshow.topicName
                    let showSlug = mshow.topicSlug
                    let show = Show(name: showName, showimageURL: showimageURL, nameSlug: showSlug)
                    showsData.append(show)
                }
                completion(showsData)
            }
        }.resume()
    }
    
    // MARK: - Retrieve Show Details
    static func getShowDetails (from url : String, completion: @escaping (ShowDetail) -> Void) {
        var showDetail = ShowDetail(name: "", featureImageLand: "", featureImg: "", titles: [""], thumbnails: [""], desc: "")
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            var result: ShowDetailResponse?
            guard let data=data, error == nil else {
                return
            }
            do {
                try result = JSONDecoder().decode(ShowDetailResponse.self, from: data)
            } catch {
                print("didnt't work out to convert json to your structure")
            }
            if let showDetailData = result?.showDetails {
                showDetail.name = showDetailData.topicName
                showDetail.featureImageLand = showDetailData.featureImgLand
                showDetail.desc = showDetailData.topicDesc
            }
            if let showDetailData = result?.data {
                showDetail.thumbnails.removeAll()
                showDetail.titles.removeAll()
                for relatedVideo in showDetailData {
                    showDetail.thumbnails.append(relatedVideo.featureImg)
                    showDetail.titles.append(relatedVideo.title)
                }
                completion(showDetail)
            }
        }.resume()
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
