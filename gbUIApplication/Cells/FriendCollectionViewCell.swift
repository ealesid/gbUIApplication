import UIKit


protocol TapImageDelegate: class {
    func tapImage()
    func tapImageEnd()
}


class FriendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelFriendName: UILabel!
    @IBOutlet weak var viewFriendPhoto: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    func setFriend(_ friend: Friend) {

        imageView.image = friend.image
        imageView.setRounded()
        
        self.viewFriendPhoto.setShadow()
        self.viewFriendPhoto.addSubview(imageView)
        
        self.labelFriendName.text = friend.name
    }
    
}


extension FriendCollectionViewCell: TapImageDelegate {
    func tapImage() {
        viewFriendPhoto.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
    }
    func tapImageEnd() {
        viewFriendPhoto.transform = CGAffineTransform.identity
    }
}
