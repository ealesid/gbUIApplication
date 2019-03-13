import UIKit

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
