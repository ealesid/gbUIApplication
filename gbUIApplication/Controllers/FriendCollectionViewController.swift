import UIKit


private let reuseIdentifier = "friendViewCell"


class FriendCollectionViewController: UICollectionViewController {
    
    weak var tapImageDelegate: TapImageDelegate?
    
    var friend: Friend!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FriendCollectionViewCell
        
        cell.setFriend(self.friend!)
        
        self.tapImageDelegate = cell
        
        return cell
    }
    

    // MARK: - GestureRecognizer
    
    @IBAction func tapImage(_ gestureRecognizer: UITapGestureRecognizer) {
        switch gestureRecognizer.state {
        case .began: self.tapImageDelegate?.tapImage()
        case .ended: self.tapImageDelegate?.tapImageEnd()
        default: return
        }
    }
}
