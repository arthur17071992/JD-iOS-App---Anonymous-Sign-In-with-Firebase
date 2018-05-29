//
//  GalleryCollectionViewController.swift
//  JD
//
//  Created by Arthur Nguyen on 4/27/18.
//  Copyright © 2018 Arthur Nguyen. All rights reserved.
//

import UIKit
import Firebase
import SwiftyJSON

class GalleryCollectionViewController: UICollectionViewController {

    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // download posts
        // 1. create a reference to the posts in the database
        FIRDatabase.database().reference().child("photoPosts").observe(.childAdded) { (snapshot) in
            // a. gets called for each of the existing child
            // b. gets called whenever a new child is added to the parent key: photoPosts
            
            DispatchQueue.main.async {
                // -- 2. parse each of the post
                let newPost = Post(snapshot: snapshot)
                // insert the post to the top of table view
                self.posts.insert(newPost, at: 0)
                let indexPath = IndexPath(row: 0, section: 0)
                // --------------------
                
                // 3. update table view
                self.collectionView?.insertItems(at: [indexPath])
            }
        }
        
    } // end func viewDidLoad

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    } // end func didReceiveMemoryWarning

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GalleryCollectionViewCell
        cell.post = self.posts[indexPath.row]
        return cell
    }
    
    @IBAction func add(_ sender: Any) {
        FIRAuth.auth()?.signInAnonymously { (user, error) in
            if error == nil {
                // successfully sign in anonymously
                self.performSegue(withIdentifier: "ShowNewsfeed", sender: nil)
            }
        }
    } // end func add
    
} // end class GalleryCollectionViewController
