//
//  File.swift
//  GabrielFilme
//
//  Created by Gabriel Aderaldo on 15/06/21.
//

import Foundation
import RealmSwift
import ObjectMapper

class Filme: Object,Mappable {
    
    var id = RealmOptional<Int>()
    var popularity = RealmOptional<Double>()
    @objc dynamic var title:String?
    @objc dynamic var overview:String?
    @objc dynamic var urlImage:String?
    @objc dynamic var release_date:String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        id.value <- map["id"]
        title <- map["title"]
        overview <- map["overview"]
        urlImage <- map["backdrop_path"]
        popularity.value <- map["popularity"]
        release_date <- map["release_date"]
        
    }
    
}
