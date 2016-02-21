//
//  Photo.swift
//  SampleRealm
//
//  Created by ShinokiRyosei on 2016/02/21.
//  Copyright © 2016年 ShinokiRyosei. All rights reserved.
//

import UIKit
import RealmSwift

class Photo: Object {
    
//    dynamic var picture: UIImage? = nil
    
    static let realm = try! Realm()
    
    dynamic var id: Int = 0
//    dynamic var name = ""
    dynamic private var _image: UIImage? = nil
    dynamic var image: UIImage? {
        set{
            self._image = newValue
            if let value = newValue {
                self.imageData = UIImagePNGRepresentation(value)
            }
        }
        get{
            if let image = self._image {
                return image
            }
            if let data = self.imageData {
                self._image = UIImage(data: data)
                return self._image
            }
            return nil
        }
    }
    dynamic private var imageData: NSData? = nil
    
    override static func primaryKey() -> String? {
        if Photo.id > 0 {
            Photo.id = Photo.id + 1
        }
        return Photo.id
    }
    
    override static func ignoredProperties() -> [String] {
        return ["image", "_image"]
    }
    
    static func loadPhoto() -> Photo {
        let photo = realm.objects(Photo)
        return photo[photo.count-1]
        
    }
    
    static func create(img: UIImage) -> Photo {
        let photo = Photo()
        photo.image = img
        
        return photo
    }
//
//    static func loadAll() -> [Photo] {
//        let photos = realm.objects(Photo).sorted("id", ascending: false)
//        var ret: [Photo] = []
//        for photo in photos {
//            ret.append(photo)
//        }
//        return ret
//    }
    
//    static func lastId() -> Int {
//        if let user = realm.objects(User).last {
//            return user.id + 1
//        } else {
//            return 1
//        }
//    }
//    
    func save() {
        try! Photo.realm.write {
            Photo.realm.add(self)
        }
    }
}
