import UIKit

class GroupsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelGroupName: UILabel!
    @IBOutlet weak var viewGroupImage: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setGroup(_ group: Group) {
        self.labelGroupName.text = group.name
        self.viewGroupImage.image = group.image
    }
}
