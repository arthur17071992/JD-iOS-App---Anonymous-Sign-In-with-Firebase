//
//  HomeViewController.swift
//  JD
//
//  Created by Arthur Nguyen on 4/27/18.
//  Copyright © 2018 Arthur Nguyen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var chromeCollectionView: UICollectionView!
    @IBOutlet weak var veganCollectionView: UICollectionView!
    @IBOutlet weak var acrylicCollectionView: UICollectionView!
    
    // create image array
    var imageArray = ["132.jpg", "155.jpg", "186.jpg", "156.jpg", "321.jpg", "320.jpg"]
    var acrylicArray = ["320.jpg", "155.jpg", "156.jpg", "186.jpg", "132.jpg", "321.jpg"]
    var videoCode = ["4D6V4p1vxFw"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // call shuffle func on array
        imageArray.shuffle()
        acrylicArray.shuffle()
        
    } // end viewDidLoad

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    } // end func didReceiveMemoryWarning
    
    // set numberOfItemsInSection for ChromeCollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // create if condition check what numberOfItemsInSection being selected
        if collectionView == chromeCollectionView {
            return imageArray.count
        }
        if collectionView == acrylicCollectionView {
            return acrylicArray.count
        }
        else {
            return videoCode.count
        }
        
    } // end numberOfItemsInSection
    
    // set cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // create if condition check what cellForItemAt being selected
        if collectionView == chromeCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chrome", for: indexPath) as! ChromeCollectionViewCell
            // display image on the cell
            cell.chromeImageView.image = UIImage(named: imageArray[indexPath.row])
            
            // display image in circle shape
            cell.chromeImageView.layer.cornerRadius = cell.chromeImageView.frame.width / 2
            cell.chromeImageView.clipsToBounds = true
            return cell
        }
        if collectionView == acrylicCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "3d", for: indexPath) as! AcrylicCollectionViewCell
            // display image on the cell
            cell.acrylicImageView.image = UIImage(named: acrylicArray[indexPath.row])
            
            // display image in circle shape
            cell.acrylicImageView.layer.cornerRadius = cell.acrylicImageView.frame.width / 2
            cell.acrylicImageView.clipsToBounds = true
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "vegan", for: indexPath) as! VeganCollectionViewCell
            // display URL link on the cell
            let url = URL(string: "https://www.youtube.com/embed/4D6V4p1vxFw")
            cell.webView.loadRequest(URLRequest(url: url!))
            return cell
        }
    } // end cellForItemAt
} // end class HomeViewController

// extention that shuffle an array
extension Array
{
    /** Randomizes the order of an array's elements. */
    mutating func shuffle()
    {
        for _ in 0..<10
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}
