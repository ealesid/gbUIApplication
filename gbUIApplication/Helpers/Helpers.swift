import UIKit

extension UITextField {
    
    func underlined() {
        
        let underlined = "underlined"

        if !(self.layer.sublayers?.contains { $0.name == underlined })! {
            let border = CALayer()
            border.name = underlined
            let width = CGFloat(0.2)
            border.borderColor = UIColor.lightGray.cgColor
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
            border.borderWidth = width
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
        }
    }
}
