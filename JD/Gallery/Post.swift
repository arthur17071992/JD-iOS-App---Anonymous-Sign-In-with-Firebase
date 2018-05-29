//
//  Post.swift
//  JD
//
//  Created by Arthur Nguyen on 4/27/18.
//  Copyright © 2018 Arthur Nguyen. All rights reserved.
//

import UIKit
import Firebase
import SwiftyJSON

class Post {
    private var image: UIImage!
    var caption: String!
    var downloadURL: String?
    
    init(image: UIImage, caption: String) {
        self.image = image
        self.caption = caption
    }
    
    init(snapshot: FIRDataSnapshot) {
        let json = JSON(snapshot.value)
        self.caption = json["caption"].stringValue
        self.downloadURL = json["imageDownloadURL"].string
    }
    
    func save() {
        // 1. create a database reference
        let newPostRef = FIRDatabase.database().reference().child("photoPosts").childByAutoId()
        let newPostKey = newPostRef.key
        
        // compress images
        if let imageData = UIImageJPEGRepresentation(image, 0.6) {
            // 2. create a storage reference
            let imageStorageRef = FIRStorage.storage().reference().child("images")
            let newImageRef = imageStorageRef.child(newPostKey)
            
            // 3. save the images to storage
            newImageRef.put(imageData).observe(.success, handler: {(snapshot) in
                // 4. save the post caption & download url
                self.downloadURL = snapshot.metadata?.downloadURL()?.absoluteString
                let newPostDictionary = [
                    "imageDownloadURL": self.downloadURL,
                    "caption": self.caption
                ]
                newPostRef.setValue(newPostDictionary)
            })
        }
    } // end func save
} // end class Post
