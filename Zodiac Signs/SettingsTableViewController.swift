//
//  SettingsTableViewController.swift
//  Zodiac Signs
//
//  Created by Haluk Isik on 7/15/15.
//  Copyright (c) 2015 Haluk Isik. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController //, FBSDKLoginButtonDelegate
{
    // MARK: - Outlets

    @IBOutlet weak var friendsSwitch: UISwitch! {
        didSet {
            userDefaults.setObject(friendsSwitch.on, forKey: "Zodiac.showFriends")
        }
    }
//    @IBOutlet weak var facebookLoginButton: FBSDKLoginButton!
    @IBOutlet weak var loginTopLabel: UILabel!
    
    @IBAction func showFriends(sender: AnyObject) {
        userDefaults.setObject(friendsSwitch?.on ?? true, forKey: "Zodiac.showFriends")
    }
    
    @IBOutlet weak var clearButton: UIButton! {
        didSet {
            clearButton.addTarget(self, action: "clearAlert", forControlEvents: UIControlEvents.TouchUpInside)
        }
    }
    
    
    // MARK: - Properties
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
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        friendsSwitch.onTintColor = zodiacColor
        println("switch = \(friendsSwitch?.on)")

//        let loginButton = FBSDKLoginButton()
//        facebookLoginButton.readPermissions = ["public_profile", "user_birthday", "user_friends"]
//        facebookLoginButton.delegate = self
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
//    override func viewDidAppear(animated: Bool) {
//        updateLabel()
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func updateLabel() {
//        loginTopLabel.text = !loggedIn ? "Log into Facebook to see your friends who are also using Zodiac Signs" : "Currently logged into Facebook"
//    }
    // MARK: - Clear data
    
    func clear()
    {
        userDefaults.removeObjectForKey("Zodiac.friendsInSign")
        userDefaults.removeObjectForKey("Zodiac.birthdays")
        
    }
    
    func clearAlert()
    {
        var clearAlert = UIAlertController(
            title: "Clear data",
            message: "Are you sure you want to erase all friends?",
            preferredStyle: .Alert)
    
        clearAlert.addAction(UIAlertAction(
            title: "Yes", style: .Destructive,
            handler: { (action: UIAlertAction!) -> Void in
                self.clear()
        }))

        clearAlert.addAction(UIAlertAction(
            title: "Cancel",
            style: .Cancel,
            handler: { (action: UIAlertAction!) in
                println("canceled")
                
        }))
        
        presentViewController(clearAlert, animated: true, completion: nil)
    }
    
    // MARK: - Facebook Login
//    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
//        if error == nil {
//            println("Login complete")
//            updateLabel()
//        } else {
//            println(error.localizedDescription)
//        }
//    }
//    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
//        println("User logged out")
//        updateLabel()
//    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 1
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
