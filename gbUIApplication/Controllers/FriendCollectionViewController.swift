import UIKit


private let reuseIdentifier = "friendViewCell"


class FriendCollectionViewController: UICollectionViewController {
    
    weak var tapImageDelegate: TapImageDelegate?
    
    var friend: Friend!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FriendCollectionViewCell
        
        cell.setFriend(self.friend!)
        
        self.tapImageDelegate = cell
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */

    @IBAction func tapImage(_ gestureRecognizer: UITapGestureRecognizer) {
        switch gestureRecognizer.state {
        case .began: self.tapImageDelegate?.tapImage()
        case .ended: self.tapImageDelegate?.tapImageEnd()
        default: return
        }
    }
}
