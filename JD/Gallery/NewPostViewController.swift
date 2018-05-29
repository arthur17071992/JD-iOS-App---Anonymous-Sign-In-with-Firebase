//
//  NewPostViewController.swift
//  JD
//
//  Created by Arthur Nguyen on 4/27/18.
//  Copyright © 2018 Arthur Nguyen. All rights reserved.
//

import UIKit

class NewPostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var captionTextView: UILabel!
    
    var takenImage: UIImage!
    var imagePicker: UIImagePickerController!
    var didShowCamera = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        if !didShowCamera {
            imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePicker.sourceType = .camera
                imagePicker.cameraCaptureMode = .photo
            } else {
                imagePicker.sourceType = .photoLibrary
            }
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    } // end func viewDidLoad

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    } // end func didReceiveMemoryWarning

    @IBAction func done(_ sender: Any) {
        if captionTextView.text != "" && takenImage != nil {
            let newPost = Post(image: self.takenImage, caption: self.captionTextView.text!)
            newPost.save()
            self.dismiss(animated: true, completion: nil)
        }
    } // end func done
    

    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    } // end func cancel
    
    @IBAction func button1(_ sender: Any) {
        captionTextView.text = "Hieu"
        captionTextView.isHidden = false
    } // end func button1
    
} // end class NewPostViewController

extension NewPostViewController
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.takenImage = image
        self.postImageView.image = self.takenImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
} // end extension NewPostViewController

/*
 
extension NewPostViewController : UITextViewDelegate
{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textViewPlaceholderText {
            textView.text = ""
            textView.textColor = .black
        }
        textView.becomeFirstResponder()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = textViewPlaceholderText
            textView.textColor = .lightGray
        }
        textView.resignFirstResponder()
    }
} // end extension NewPostViewController
 
 */
