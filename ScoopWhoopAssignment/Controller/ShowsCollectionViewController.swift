//
//  ShowsListCollectionViewController.swift
//  ScoopWhoopAssignment
//
//  Created by Harshit Jain on 22/06/21.
//

import UIKit

//private var showsList = [Datum]()
class ShowsCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        shows = API.getAllShows(from: K.URL_ALL_SHOWS, collectionView: collectionView)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 6
        return shows.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShowCell", for: indexPath) as! ShowCollectionViewCell
//        cell.showLabel.text = "asgf"
//        cell.showImage.image = #imageLiteral(resourceName: "Image")
        cell.showLabel.text = shows[indexPath.row].name
        cell.showImage.downloaded(from: shows[indexPath.row].imageURL)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //get what was selected and get the data accordingly
        
    }
}

extension ShowsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/2 - 5, height: 300)
    }
}

