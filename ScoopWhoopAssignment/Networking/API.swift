//
//  API.swift
//  ScoopWhoopAssignment
//
//  Created by Harshit Jain on 23/06/21.
//

import UIKit

class API {
    
    
    //mark Retrieve All Shows
    
    func getAllShows (from url : String, collectionView: UICollectionView ) -> [FakeShow] {
        var showsData = [FakeShow]()
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            var result: Shows?
            guard let data=data, error == nil else {
                return
            }
            do {
                try result = JSONDecoder().decode(Shows.self, from: data)
            } catch {
                print("didnt't work out to convert json to your structure")
            }
            if let showData = result?.data {
                for mshow in showData {
                    let imageURL = mshow.topicFeatureImg
                    let showName = mshow.topicName
                    let show = FakeShow(name: showName, imageURL: imageURL)
                    showsData.append(show)
                }
            }
            DispatchQueue.main.async {
                fakeShows = API().getAllShows(from: url, collectionView: collectionView)
                collectionView.reloadData()
            }
            
        }.resume()
        return showsData
    }
    
    // Retrieve images
    func getImage (from url : String) -> UIImage {
        var image = #imageLiteral(resourceName: "Image")
            URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
    
            guard let data=data, error == nil else {
                return
            }
            if let imageData = UIImage(data: data) {
                image = imageData
            }
        }.resume()
        return image
    }
    
}
