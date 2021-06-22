//
//  ShowCollectionViewCell.swift
//  ScoopWhoopAssignment
//
//  Created by Harshit Jain on 22/06/21.
//

import UIKit

class ShowCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var showLabel: UILabel!
    
    func createShow(name: String, image: UIImage) {
        self.showImage.image = image
        self.showLabel.text = name
    }
}
