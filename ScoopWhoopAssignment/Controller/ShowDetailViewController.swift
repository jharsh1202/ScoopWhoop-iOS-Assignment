//
//  ShowDetailViewController.swift
//  ScoopWhoopAssignment
//
//  Created by Harshit Jain on 23/06/21.
//

import UIKit

var showDetailURL = ""

class ShowDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var showDetail = ShowDetail(name: "", featureImageLand: "", featureImg: "", titles: [""], thumbnails: [""], desc: "")
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        API.getShowDetails(from: showDetailURL, completion: reloadUI)
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
    
    func reloadUI(showDetail: ShowDetail) -> Void {
        self.showDetail = showDetail
        DispatchQueue.main.async {
            self.imageView.downloaded(from: showDetail.featureImageLand)
            self.descriptionTextView.text = showDetail.desc
            self.title = showDetail.name
            self.titleLabel.text = showDetail.name
            self.collectionView.reloadData()
        }
    }
    
}

extension ShowDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/2 - 5, height: 300)
    }
}

