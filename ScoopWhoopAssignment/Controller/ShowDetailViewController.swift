//
//  ShowDetailViewController.swift
//  ScoopWhoopAssignment
//
//  Created by Harshit Jain on 23/06/21.
//

import UIKit

var showDetailURL = ""
var showDetail = ShowDetail(name: "", featureImageLand: "", featureImg: "", titles: [""], thumbnails: [""], desc: "")

class ShowDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        API.getShowDetails(from: showDetailURL, collectionView: collectionView, imageView: imageView, descriptionTextView: descriptionTextView, viewController: self, titleLabel: titleLabel)
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

