import UIKit


class FriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelFriendName: UILabel!
    @IBOutlet weak var imageFriendPhoto: UIImageView!
    
    
    func setFriend(_ friend: Friend) {
        self.labelFriendName.text = friend.name
        self.imageFriendPhoto.image = friend.image
        self.imageFriendPhoto.setRounded()
    }
    
}
