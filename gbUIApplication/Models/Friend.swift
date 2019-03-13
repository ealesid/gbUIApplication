import Foundation
import UIKit


class Friend {
    var name: String?
    var image: UIImage?
    
    init(name: String, image: UIImage = UIImage(named: "noPhoto")!) {
        self.name = name
        self.image = image
    }
}
