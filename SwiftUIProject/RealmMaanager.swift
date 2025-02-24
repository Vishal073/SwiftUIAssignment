//
//  RealmMaanager.swift
//  SwiftUIProject
//
//  Created by Vishal  on 24/02/25.

import RealmSwift
// MARK: - Realm Manager
class RealmManager {
    private let realm = try! Realm()
    
    func savePhotos(_ photos: [Photo]) {
        try! realm.write {
            let objects = photos.map { photo in
                let obj = RoverPhotoObject()
                obj.id = photo.id
                obj.imgSrc = photo.imgSrc
                obj.roverName = photo.rover.name.rawValue
                obj.landingDate = photo.rover.landingDate
                obj.launchDate = photo.rover.launchDate
                obj.status = photo.rover.status.rawValue
                return obj
            }
            realm.add(objects, update: .modified)
        }
    }
    
    func fetchPhotos() -> [RoverPhotoObject] {
        return Array(realm.objects(RoverPhotoObject.self))
    }
}
