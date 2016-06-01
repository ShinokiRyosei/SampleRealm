//
//  ViewController.swift
//  SampleRealm
//
//  Created by ShinokiRyosei on 2016/01/17.
//  Copyright © 2016年 ShinokiRyosei. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    
    let realm = try! Realm()
    
    let defaultFilePath = RLMRealm.defaultRealm()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func accessToPhotos() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func save(sender: AnyObject) {
        if imageView.image == nil {
            
        }else {
            let data = imageView.image!
            let photos = Photo.create(data)
            photos.save()
            
            
        }
        
    }
    
    @IBAction func getPhoto(sender: UIButton) {
        let photo = Photo.loadPhoto()
        imageView.image = photo.image
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image: UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        imageView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }


}

