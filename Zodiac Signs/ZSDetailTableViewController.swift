//
//  ZSDetailTableViewController.swift
//  Zodiac Signs
//
//  Created by Haluk Isik on 7/11/15.
//  Copyright (c) 2015 Haluk Isik. All rights reserved.
//

import UIKit

class ZSDetailTableViewController: UITableViewController
{
    // MARK: - Properties
    
    var friendsInSign = [[String]]()
    var birthdaysInSign = [[NSDate]]()
//    var birthdays = [String:NSDate]()
    var showFriends = true
//    var facebookFriends: AnyObject? {
//        didSet {
//            if facebookFriends != nil {
//                tableView.reloadData()
//            }
//        }
//    }
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
//    var loggedIn: Bool {
//        if FBSDKAccessToken.currentAccessToken() == nil {
//            println("Not logged in")
//            return false
//        } else {
//            println("Logged in")
//            return true
//        }
//    }

    var selectedSignNumber: Int?
    private var selectedSign: ZodiacSigns!
//    var properties: [[String]] = [ZodiacSigns.Element.all.descriptions, ZodiacSigns.Metal.all.descriptions, ZodiacSigns.Mode.all.descriptions, ZodiacSigns.Stone.all.descriptions]
    private var properties = [String]()
    private var propertyHeaders = ["Element: ", "Metal: ", "Mode: ", "Stone: ", "Perfume: ", "Plant: ", "Flower: ", "Planet: ", "Color: ", "Keyword: ", "Day: ", "Ruler: "]
    
    // A bug in UITableViewAutomaticDimension
    // To correct, I force reload (once) in viewDidAppear
    // I reload once, so that when we go back to the tab,
    // the scroll position stays the same and that I don't
    // unnecessarily reload data
    private var dataReloaded = false
    private struct Defaults {
        static let Friends = "Zodiac.friendsInSign"
        static let Birthdays = "Zodiac.birthdaysInSign"
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.hidesBarsOnSwipe = true
//        self.shyNavBarManager.scrollView = tableView
        
        let rightBarButtonItem1 = UIBarButtonItem(image: UIImage(named: "add-friend"), style: .Plain, target: self, action: "addFriend")
        let rightBarButtonItem2 = self.editButtonItem()
        self.navigationItem.rightBarButtonItems = [rightBarButtonItem2, rightBarButtonItem1]
                
        println("ZSDetailTableViewController viewDidLoad")
        if let selectedSignNumber = self.selectedSignNumber {
            selectedSign = ZodiacSigns(selectedSignNumber: selectedSignNumber)
            println("selectedSign.sunSign.description = \(selectedSign.sunSign.description)")
            title = selectedSign.sunSign.description
            
            selectedSign = ZodiacSigns(selectedSignNumber: selectedSignNumber)
            properties = [
                selectedSign.element.description,
                selectedSign.metal.description,
                selectedSign.mode.description,
                selectedSign.stone.description,
                selectedSign.perfume.description,
                selectedSign.plant.description,
                selectedSign.flower.description,
                selectedSign.planet.description,
                selectedSign.color.description,
                selectedSign.keyword.description,
                selectedSign.day.description,
                selectedSign.ruler.description]

            tableView.estimatedRowHeight = tableView.rowHeight
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.separatorStyle = .None
            
            if let sign = userDefaults.objectForKey(Defaults.Friends) as? [[String]] {
                friendsInSign = sign
            } else {
                for _ in 0...11 {
                    friendsInSign.append([])
                }
            }
            if let bday = userDefaults.objectForKey(Defaults.Birthdays) as? [[NSDate]] {
                birthdaysInSign = bday
            } else {
                for _ in 0...11 {
                    birthdaysInSign.append([])
                }
            }
            
            println("friendsInSign = \(friendsInSign)")
            println("selectedSignNumber = \(selectedSignNumber)")
            println("friendsInSign[selectedSignNumber] = \(friendsInSign[selectedSignNumber])")
            println("friendsInSign[selectedSignNumber].isEmpty = \(friendsInSign[selectedSignNumber].isEmpty)")
            println("friendsInSign[selectedSignNumber].count = \(friendsInSign[selectedSignNumber].count)")
            
            
        }


    }
    // A bug in UITableViewAutomaticDimension
    // To correct, we force reload
    override func viewDidAppear(animated: Bool)
    {
        println("view did appear")
//        if !dataReloaded {
//            tableView.reloadData()
//            dataReloaded = true
//        }
        if let friendsSwitch = userDefaults.objectForKey("Zodiac.showFriends") as? Bool {
            showFriends = friendsSwitch
            println("showFriends = \(showFriends)")
        }
//        getFBUserData()
//        println("facebookFriends = \(facebookFriends)")

        tableView.reloadData()

        tableView.setNeedsLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
//        println("(numberOfSectionsInTableView) properties.count = \(properties.count)")
        return 3
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        switch section {
        case 0:
            return nil
        case 1:
            return "Properties of " + selectedSign.sunSign.description
        default:
            if showFriends && friendsInSign[selectedSignNumber!].count == 1 {
                return "\(friendsInSign[selectedSignNumber!].count) \(selectedSign.sunSign) friend"
            } else if showFriends && friendsInSign[selectedSignNumber!].count > 1 {
                return "\(friendsInSign[selectedSignNumber!].count) \(selectedSign.sunSign) friends"
            }
            else {
                return nil
            }
        }
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let tableHeaderView = view as! UITableViewHeaderFooterView
        tableHeaderView.textLabel.textAlignment = .Center
        tableHeaderView.textLabel.font = zodiacFont
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.

        switch section {
        case 0:
            return 1
        case 1:
            return properties.count
        default:
            return showFriends ? friendsInSign[selectedSignNumber!].count : 0
        }
    }
    
    private struct Cell {
        static let Main = "main"
        static let Detail = "detail"
        static let Friend = "friend"
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(Cell.Main, forIndexPath: indexPath) as! SunSignTableViewCell
            cell.sunSign = selectedSign.sunSign
//            tableView.rowHeight = UITableViewAutomaticDimension
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier(Cell.Detail, forIndexPath: indexPath) as! PropertiesTableViewCell
            cell.property?.text = propertyHeaders[indexPath.row]
            cell.detailProperty?.text = properties[indexPath.row]
//            cell.detailTextLabel?.numberOfLines = 0
//            cell.detailTextLabel?.sizeToFit()
            cell.layoutSubviews()
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier(Cell.Friend, forIndexPath: indexPath) as! UITableViewCell
            cell.textLabel?.text = friendsInSign[selectedSignNumber!][indexPath.row]
            let date = birthdaysInSign[selectedSignNumber!][indexPath.row]
            let dateFormatter = NSDateFormatter()
//            dateFormatter.dateFormat = "yyyy-MM-dd"
            dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
            let dateString = dateFormatter.stringFromDate(date)
            
            cell.detailTextLabel?.text = "Birthday: " + dateString
            return cell
        }

    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        getFBUserData()
        println("selected indexPath = \(indexPath)")
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    // MARK: - Table View Editing
    // called when a row deletion action is confirmed
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
            switch editingStyle {
            case .Delete:
                // remove the deleted item from the model
                friendsInSign[selectedSignNumber!].removeAtIndex(indexPath.row)
                
                // remove the deleted item from the `UITableView`
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                
                // remove the deleted item from user defaults (replace the new model with the one in user defaults)
                userDefaults.setObject(friendsInSign, forKey: Defaults.Friends)
            default:
                return
            }
    }
    
    // called when a row is moved
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
            // remove the dragged row's model
            let val = friendsInSign[selectedSignNumber!].removeAtIndex(sourceIndexPath.row)
            
            // insert it into the new position
            friendsInSign[selectedSignNumber!].insert(val, atIndex: destinationIndexPath.row)
        
            userDefaults.setObject(friendsInSign, forKey: Defaults.Friends)
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        switch indexPath.section {
        case 0: fallthrough
        case 1: return false
        default: return true
        }
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        switch indexPath.section {
        case 0: fallthrough
        case 1: return .None
        default: return .Delete
        }
    }
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        switch indexPath.section {
        case 0: fallthrough
        case 1: return false
        default: return true
        }

    }
    
    override func tableView(tableView: UITableView, targetIndexPathForMoveFromRowAtIndexPath sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath
    {
        if( sourceIndexPath.section != proposedDestinationIndexPath.section ) {
            return sourceIndexPath
        } else {
            return proposedDestinationIndexPath
        }
    }

    // MARK: - Add friends
    func addFriend()
    {
        println("Adding friend")
        performSegueWithIdentifier(Segue.AddFriend, sender: self)
        
    }
    
    @IBAction func unwindFromAddFriend(unwindSegue: UIStoryboardSegue)
    {
        println("dismissed")
        println("selectedSignNumber = \(selectedSignNumber)")
        println("friendsInSign = \(friendsInSign)")
        
        println("friendsInSign.count = \(friendsInSign.count)")
        if friendsInSign.count == 0 {
            for _ in 0...11 {
                friendsInSign.append([])
            }
        }
        println("friendsInSign.count = \(friendsInSign.count)")
        
        var destination: ZSDetailTableViewController = unwindSegue.destinationViewController as! ZSDetailTableViewController
        
        if destination == self {
            println("destination is self")
        }
        
        tableView.reloadData()

    }
    
    // MARK: - Facebook - Get friends
    
//    func getFBUserData() {
//        println("getting user data")
//        if FBSDKAccessToken.currentAccessToken() != nil {
//            FBSDKGraphRequest(
//                graphPath: "me",
//                parameters: ["fields": "name, birthday, friends"]).startWithCompletionHandler { (connection, result, error) -> Void in
//                if error == nil {
//                    println(result)
//                    let resultDict = result["friends"] as! NSDictionary
////                    println("resultDict = \(resultDict)")
//                    
//                    self.facebookFriends = resultDict["data"]
//                    println("self.facebookFriends = \(self.facebookFriends)")
//                }
//            }
//        }
//    }
    // Get List Of Friends
//    var friendsRequest: FBRequest = FBRequest.requestForMyFriends()
//    friendsRequest.startWithCompletionHandler{(connection:FBRequestConnection!, result:AnyObject!, error:NSError!) -> Void in
//        var resultdict = result as NSDictionary
//        println("Result Dict: \(resultdict)")
//        var data : NSArray = resultdict.objectForKey("data") as NSArray
//        
//        for i in 0..<data.count {
//            let valueDict : NSDictionary = data[i] as NSDictionary
//            let id = valueDict.objectForKey("id") as String
//            println("the id value is \(id)")
//        }
//        
//        var friends = resultdict.objectForKey("data") as NSArray
//        println("Found \(friends.count) friends")
//    }
//    
//    // MARK: - Facebook Delegate Methods
//    
//    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
//        println("User Logged In")
//    }
//    
//    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
//        println("User: \(user)")
//        println("User ID: \(user.objectID)")
//        println("User Name: \(user.name)")
//        var userEmail = user.objectForKey("email") as String
//        println("User Email: \(userEmail)")
//    }
//    
//    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
//        println("User Logged Out")
//    }
//    
//    func loginView(loginView : FBLoginView!, handleError:NSError) {
//        println("Error: \(handleError.localizedDescription)")
//    }
    
//    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        if indexPath.section == 0 {
//            let cell = tableView.dequeueReusableCellWithIdentifier(Cell.Main) as! SunSignTableViewCell
//            cell.sunSign = selectedSign.sunSign
//            return cell.height
//        } else {
////            let cell = tableView.dequeueReusableCellWithIdentifier(Cell.Detail) as! UITableViewCell
////            let height = cell.detailTextLabel?.contentSize.height
////            return height ?? tableView.rowHeight
//            return tableView.rowHeight
//        }
//    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation
    private struct Segue {
        static let AddFriend = "Add friend"
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        var destination: AnyObject = segue.destinationViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        if let identifier = segue.identifier {
            switch identifier {
            case Segue.AddFriend:
                if let mvc: MessageViewController = destination as? MessageViewController {
                    mvc.selectedSignNumber = selectedSignNumber!
                }
            default:
                break
                
            }
        }
    }

}
