import UIKit


protocol TapImageDelegate: class {
    func tapImage()
    func tapImageEnd()
}


class FriendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelFriendName: UILabel!
    @IBOutlet weak var viewFriendPhoto: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageViewLike: UIImageView!
    
    var likeImages: [UIImage] = []
    
    func setFriend(_ friend: Friend) {

        imageView.image = friend.image
        imageView.setRounded()
        
        self.viewFriendPhoto.setShadow()
        self.viewFriendPhoto.addSubview(imageView)
        
        self.labelFriendName.text = friend.name
        
        self.imageViewLike.image =  friend.isLiked ? UIImage(named: "heart-23") : UIImage(named: "heart-0")
    }
    
}


extension FriendCollectionViewCell {
    
    func createImagesArray(total: Int, prefix: String) -> [UIImage] {
        var imagesArray: [UIImage] = []
        for count in 0..<total { imagesArray.append(UIImage(named: "\(prefix)-\(count)")!) }
        return imagesArray
    }
    
    func animate(imageview: UIImageView, images: [UIImage]) {
        imageview.animationImages = images
        imageview.animationDuration = 1.0
        imageview.animationRepeatCount = 1
        imageview.startAnimating()
    }
}


extension FriendCollectionViewCell: TapImageDelegate {
    func tapImage() {
        viewFriendPhoto.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
        self.animate(imageview: imageViewLike, images: createImagesArray(total: 23, prefix: "heart"))
    }
    func tapImageEnd() {
        viewFriendPhoto.transform = CGAffineTransform.identity
    }
}
