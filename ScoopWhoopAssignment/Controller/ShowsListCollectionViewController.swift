//
//  ShowsListCollectionViewController.swift
//  ScoopWhoopAssignment
//
//  Created by Harshit Jain on 22/06/21.
//

import UIKit

class ShowsListCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://stagingsw.scoopwhoop.com/uns/api/v1/all_shows/"
        
        getData(from: url)
        func getData (from url : String)  {
            print("retriving Data ")
            URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
                guard let data=data, error == nil else {
                    return
                }
                var result: Response?
                do {
                    try result = JSONDecoder().decode(Response.self, from: data)
                } catch {
                    print("didnt't work out to convert json to your structure")
                }
                
                guard let jsonData = result else {
                    return
                }
                
                print(jsonData.status)
                
                print(jsonData.data)
                
                
            }.resume()
           

        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shows.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShowCell", for: indexPath) as! ShowCollectionViewCell
        cell.showLabel.text = shows[indexPath.row].name
        cell.showImage.image = shows[indexPath.row].image
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //get what was selected and get the data accordingly
    }
}

extension ShowsListCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/2 - 5, height: 300)
    }
}

