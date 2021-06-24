//
//  ShowDetailViewController.swift
//  ScoopWhoopAssignment
//
//  Created by Harshit Jain on 23/06/21.
//

import UIKit

class ShowDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = #imageLiteral(resourceName: "Image")
        collectionView.dataSource = self
        collectionView.delegate = self
        API.getShowDetails(from: showDetailURL, collectionView: collectionView)
//        self.title = showDetail.name //get on time
//        descriptionTextView.text = showDetail.desc //get on time
//        imageView.image = showDetail.featureImageLand // get IMage from URL
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Count")
        return showDetail.titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("buildingCELL")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! RelatedVideoCollectionViewCell
        cell.videoLabel.preferredMaxLayoutWidth = self.view.frame.width/2 - 15
        cell.videoLabel.text = showDetail.titles[indexPath.row]
        cell.videoImageView.downloaded(from: showDetail.thumbnails[indexPath.row])
        return cell
    }
    
}

extension ShowDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/2 - 5, height: 300)
    }
}
