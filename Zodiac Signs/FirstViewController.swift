//
//  FirstViewController.swift
//  Zodiac Signs
//
//  Created by Haluk Isik on 12/3/14.
//  Copyright (c) 2014 Haluk Isik. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate { //, FBSDKLoginButtonDelegate {
    
    // MARK - Outlets and Properties
    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var signImage: UIImageView!
    
    var dateFormatter = NSDateFormatter()
    let startDates = ["3-21", "4-20", "5-21", "6-21", "7-23", "8-23", "9-23", "10-24", "11-23", "12-22", "1-01", "1-20", "2-19"]
    let endDates = ["4-19", "5-20", "6-20", "7-22", "8-22", "9-22", "10-23", "11-22", "12-21", "12-31", "1-19", "2-18", "3-20"]
    let maxDays = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    var selectedMonth = 0
    var selectedSignNumber = 0

    
    // MARK - Instance Methods
    func updateLabel() {
        
        let month = myPicker.selectedRowInComponent(0)
        let day = myPicker.selectedRowInComponent(1)
        println("month = \(month)")
        println("day = \(day)")
        
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US")
        dateFormatter.dateFormat = "M-d-H:mm"
        let date = dateFormatter.dateFromString("\(month+1)"+"-"+"\(day+1)"+"-10:12")
        println("date = \(date)")
        //date?.truncateToDay()
        //println("after truncation - date = \(date)")

        for i in 0...12 {
            let startDate = dateFormatter.dateFromString("\(startDates[i])"+"-10:12")
            let endDate = dateFormatter.dateFromString("\(endDates[i])"+"-10:12")
            println("deneme \(startDate) \(endDate)")
            if (date!.isBetweenDates(startDate!, endDate: endDate)) {
                signImage.image = UIImage(named: "signs_\(i <= 9 ? i + 1 : i)x")
                selectedSignNumber = i <= 9 ? i : i - 1
                println("signs_\(i+1)x")
                println("signs_\(i + 1 <= 10 ? i + 1 : i)x")

            }
        }
    }
    
    func betweenDates(date1: NSDate, date2: NSDate, date: NSDate) {
        
    }
    
    // MARK - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        println("view.bounds.size.height = \(view.bounds.size.height)")
        // Facebook
//        if FBSDKAccessToken.currentAccessToken() == nil {
//            println("Not logged in")
//        } else {
//            println("Logged in")
//        }
//        let loginButton = FBSDKLoginButton()
//        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
//        loginButton.delegate = self
        
        var monthName: AnyObject = dateFormatter.monthSymbols[0]
        
        myPicker.delegate = self
        myPicker.dataSource = self
        
        var tapGesture = UITapGestureRecognizer(target: self, action: "detailView")
        signImage.userInteractionEnabled = true
        signImage.addGestureRecognizer(tapGesture)
        
        // Select current date in picker view
        let currentDate = NSDate()
        myPicker.selectRow(currentDate.month - 1, inComponent: 0, animated: false)
        myPicker.selectRow(currentDate.day - 1, inComponent: 1, animated: false)
        
        updateLabel()

    }
    
    func detailView() {
        println("This is detailView")
        performSegueWithIdentifier("detailView", sender: self)
    }
    
    // MARK - Delegates and Data Source
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        switch (component)
        {
        case 0:
            return 12
        case 1:
            return maxDays[selectedMonth]
        default:
            return 0
        }
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        switch (component)
        {
        case 0:
            return dateFormatter.monthSymbols[row] as! String
        case 1:
            return "\(row+1)"
        default:
            return ""
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (component == 0) { selectedMonth = row }
        myPicker.reloadComponent(1)
        updateLabel()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "detailView") {
            let vc = segue.destinationViewController as! ZSDetailTableViewController
            if segue.destinationViewController.isKindOfClass(ZSDetailTableViewController) {
                println("Class matches")
                vc.selectedSignNumber = selectedSignNumber
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

