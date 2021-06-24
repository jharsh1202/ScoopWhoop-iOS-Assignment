//
//  API.swift
//  ScoopWhoopAssignment
//
//  Created by Harshit Jain on 23/06/21.
//

import UIKit

class API {
    
    
    //mark Retrieve All Shows
    func getAllShows (from url : String, collectionView: UICollectionView ) -> [Show] {
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
                    let imageURL = mshow.featureImgPort
                    let showName = mshow.topicName
                    let show = Show(name: showName, imageURL: imageURL)
                    showsData.append(show)
                }
            }
            DispatchQueue.main.async {
                shows = showsData
                collectionView.reloadData()
            }
        }.resume()
        return showsData
    }
}



extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
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
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
