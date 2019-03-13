import Foundation
import UIKit

class Group {
    var name: String?
    var image: UIImage?
    
    init(name: String, image: UIImage = UIImage(named: "noPhoto")!) {
        self.name = name
        self.image = image
    }
}


extension Group: Equatable {
    static func == (lhs: Group, rhs: Group) -> Bool {
        return lhs.name == rhs.name
    }
}
