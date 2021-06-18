
import Foundation
import RealmSwift
import ObjectMapper

class Detalhes: Object,Mappable {
    
    var id = RealmOptional<Int>()
    @objc dynamic var name:String?
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        id.value <- map["id"]
        name <- map["name"]
    }
    
}
