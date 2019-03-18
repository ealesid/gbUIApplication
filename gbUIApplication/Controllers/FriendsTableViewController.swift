import UIKit

private let reusableCell = "FriendsTableViewCell"

class FriendsTableViewController: UITableViewController {
    
    var friends: [Friend] = [
        Friend(name: "1st Friend", image: UIImage(named: "firstFriend")!),
        Friend(name: "2nd Friend", image: UIImage(named: "secondFriend")!),
        Friend(name: "3rd Friend"),
        ]
    
    var friendsFiltered: [Friend] = []
    
    var sections: [String] = []
    var friendsInSections: [String: [Friend]] = [:]
    
    private var selectedFriend: Friend?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.friendsFiltered = self.friends
        
        fillSections()
        fillSectionsWithFriends()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionName: String = self.sections[section]
        if let friendsInSection: [Friend] = self.friendsInSections[sectionName] { return friendsInSection.count }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableCell, for: indexPath) as! FriendsTableViewCell
        
        let sectionName: String = self.sections[indexPath.section]
        if let friendsInSection: [Friend] = self.friendsInSections[sectionName] {
            cell.setFriend(friendsInSection[indexPath.row])
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = self.sections[section]
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        label.textColor = UIColor.darkGray
        
        return label
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
                destinationVC.friend = self.friendsFiltered[self.tableView.indexPathForSelectedRow!.row]
            }
        }
        
        
    }
    
}


extension FriendsTableViewController {
    func filter(query: String) {
        self.friendsFiltered.removeAll()
        
        var isInFilter = true
        
        for friend in self.friends {
            if query.count > 0 { isInFilter = (friend.name?.lowercased().contains(query.lowercased()))! }
            if isInFilter { self.friendsFiltered.append(friend) }
        }
        
        self.fillSections()
        self.fillSectionsWithFriends()
    }
    
    func fillSections() {
        sections = Array(Set(friendsFiltered.map { String(($0.name?.first)!) })).sorted()
        print("\n\(#file)\n\t\(#function):\t\(#line)\n\t\(sections)")
    }
    
    func fillSectionsWithFriends() {
        self.friendsInSections.removeAll()
        
        for friend in self.friendsFiltered {
            guard let firstLetter = friend.name?.first else { continue }
            
            var friends: [Friend] = []
            
            if let friendsInSections = self.friendsInSections[String(firstLetter)] {
                friends.append(contentsOf: friendsInSections)
            }
            
            friends.append(friend)
            
            self.friendsInSections[String(firstLetter)] = friends
        }
        
        self.tableView.reloadData()
    }
}


extension FriendsTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filter(query: searchText)
    }
}
