import UIKit

private let reuseIdentifier = "FriendsTableViewCell"

class FriendsTableViewController: UITableViewController {
    
    var friends: [Friend] = [
        Friend(name: "1st Friend", image: UIImage(named: "firstFriend")!),
        Friend(name: "2nd Friend", image: UIImage(named: "secondFriend")!),
        Friend(name: "3rd Friend"),
        ]
    
    private var selectedFriend: Friend?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FriendsTableViewCell
        
        cell.setFriend(self.friends[indexPath.row])
        
        return cell
    }
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        //        print("prepeare \(String(describing: segue.identifier))")
        
        if let identifier = segue.identifier, identifier == "showFriendInfo" {
            if let destinationVC = segue.destination  as? FriendCollectionViewController {
                destinationVC.friend = self.friends[self.tableView.indexPathForSelectedRow!.row]
            }
        }
        
        
    }
    
}
