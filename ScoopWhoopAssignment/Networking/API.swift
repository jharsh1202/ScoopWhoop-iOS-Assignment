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
            print(showsData)
            DispatchQueue.main.async {
                shows = showsData
                collectionView.reloadData()
            }
        }.resume()
        return showsData
    }
    
    // Retrieve images
    func getImage (from url : String, view: Any?) -> UIImage {
        var image:UIImage = #imageLiteral(resourceName: "Image")
            URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
    
            guard let data=data, error == nil else {
                return
            }
            if let imageData = UIImage(data: data) {
                image = imageData
            }
//                
//            DispatchQueue.main.async {
//                shows = showsData
//                view.reloadData()
//            }

        }.resume()
        return image
    }
    
}
