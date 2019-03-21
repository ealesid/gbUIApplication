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


extension UIView {
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get { return layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get { return layer.shadowOpacity }
        set { layer.shadowOpacity = newValue }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get { return layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    
    func setRounded() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true
    }
    
    func setShadow() {
        self.backgroundColor = nil
        self.clipsToBounds = false
        
//        Закомментировано - устанавливаем из Interface Builder
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOpacity = 0.5
//        self.layer.shadowOffset = CGSize.zero
//        self.layer.shadowRadius = 5
        
        self.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: frame.width / 2).cgPath
    }
}



extension UITapGestureRecognizer {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        if self.state == .possible { self.state = .began }
    }
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        self.state = .recognized
    }
}


var vLoader : UIView?

extension UIViewController {
    func showLoader(on view: UIView) {

        let loaderView = UIView(frame: view.frame)
        loaderView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        view.addSubview(loaderView)
        
        let color = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
        let size = CGSize(width: 15, height: 15)

        let circleSpacing: CGFloat = 50
        let circleSize: CGFloat = (size.width - 2 * circleSpacing) / 3
        let x: CGFloat = (view.frame.width - size.width * 3) / 2
        let y: CGFloat = (view.frame.height + circleSize * 5) / 2
        
        for i in 0 ..< 3 {
            let layer = CAShapeLayer()
            let circle = UIBezierPath(ovalIn: CGRect(origin: CGPoint(x: x + circleSize * CGFloat(i) + circleSpacing * CGFloat(i), y: y), size: size))
            layer.path = circle.cgPath
            layer.fillColor = color.cgColor
            view.layer.addSublayer(layer)
        }
        
        vLoader = loaderView
    }
    
    func removeLoader() {
        DispatchQueue.main.async {
            vLoader?.removeFromSuperview()
            vLoader = nil
        }
    }
}
