//
//  GalleryCollectionViewCell.swift
//  JD
//
//  Created by Arthur Nguyen on 4/27/18.
//  Copyright © 2018 Arthur Nguyen. All rights reserved.
//

import UIKit
import Firebase

class GalleryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    var post: Post!{
        didSet{
            self.updateUI()
        }
    }
    
    func updateUI() {
        // caption
        self.captionLabel.text = post.caption
        
        // download cell photo
        if let imageDownloadURL = post.downloadURL {
            // 1. create a storage reference
            let imageStorageRef = FIRStorage.storage().reference(forURL: imageDownloadURL)
            // 2. observe method to download the data
            imageStorageRef.data(withMaxSize: 2 * 1024 * 1024) { [weak self] (data, error) in
                if let error = error {
                    print("******** \(error)")
                } else {
                    // success
                    if let imageData = data {
                        DispatchQueue.main.async {
                            // 3. put the image to imageView
                            let image = UIImage(data: imageData)
                            self?.postImageView.image = image
                        }
                    }
                }
            }
        }
    } // end func updateUI
    
} // end class GalleryCollectionViewCell
