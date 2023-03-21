//
//  AppDelegate.swift
//  Zodiac Signs
//
//  Created by Haluk Isik on 12/3/14.
//  Copyright (c) 2014 Haluk Isik. All rights reserved.
//

import UIKit
//import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.

        // Change back button color
        UIBarButtonItem.appearance()
            .setTitleTextAttributes([ NSFontAttributeName: zodiacFont,  NSForegroundColorAttributeName: zodiacColor],
                forState: UIControlState.Normal)
        
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: .Alert | .Badge | .Sound, categories: nil))  // types are UIUserNotificationType members

//        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        return true
    }
    
    func createNotifications()
    {
        let startDates = ["3-21", "4-20", "5-21", "6-21", "7-23", "8-23", "9-23", "10-24", "11-23", "12-22", "1-20", "2-19"]

        let currentDate = NSDate()
        let todaysSign = ZodiacSigns.signFromDate(currentDate)
        let todaysSunSign = todaysSign.sunSign.description
        let testDate = NSDate().dateByAddingTimeInterval(5.0)
        let testDate2 = NSDate().dateByAddingTimeInterval(10.0)
        
        let cal = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let components = cal!.components(.CalendarUnitMinute | .CalendarUnitHour | .CalendarUnitDay | .CalendarUnitMonth | .CalendarUnitYear, fromDate: currentDate)
        components.timeZone = NSTimeZone.localTimeZone()
        components.hour = 11
        components.minute = 49
        
        let oneDay = NSDateComponents()
        oneDay.setValue(1, forComponent: NSCalendarUnit.DayCalendarUnit)
        let fiveDays = NSDateComponents()
        fiveDays.setValue(5, forComponent: NSCalendarUnit.DayCalendarUnit)
        let tenDays = NSDateComponents()
        tenDays.setValue(10, forComponent: NSCalendarUnit.DayCalendarUnit)
        
        let notificationMessages = [
            ["Did you know the symbol of the ram is based on the Chrysomallus?",
                ""],
            ["Did you know the symbol of the bull is based on the Cretan Bull?",
                ""],
            ["Did you know the symbol of the twins is based on the Dioscuri?",
                ""],
            ["Did you know the symbol of the crab is based on the Karkinos?",
                ""],
            ["Did you know the symbol of the lion is based on the Nemean Lion?",
                ""],
            ["Did you know the symbol of the maiden is based on Astraea?",
                ""],
            ["Did you know the symbol of the scales is based on the Scales of Justice held by Themis?",
                ""],
            ["Did you know the symbol of the scorpion is based on Scorpius, a giant scorpion sent by Gaia to kill Orion?",
                ""],
            ["Did you know the symbol of the archer is based on the centaur Chiron?",
                ""],
            ["Did you know that Capricorn symbol is based on the Sumerian primordial god of wisdom and waters?",
                ""],
            ["Did you know the water carrier represented by the zodiacal constellation Aquarius is Ganymede?",
                ""],
            ["Did you know the symbol of the fishes is derived from the ichthyocentaurs?",
                ""]

        ]
        
        // Create notifications
        let signs = ZodiacSigns.SunSign.all.descriptions
        var notification = UILocalNotification()

        var app:UIApplication = UIApplication.sharedApplication()
        for oneEvent in app.scheduledLocalNotifications {
            var notification = oneEvent as! UILocalNotification
            //            let userInfoCurrent = notification.userInfo! as! [String:AnyObject]
            //            let uid = userInfoCurrent["uid"]! as String
            let category = "ZODIAC_CATEGORY"
            if notification.category == category {
                //Cancelling local notification
                app.cancelLocalNotification(notification)
                //                break;
            }
        }

        
        let grantedSettings = UIApplication.sharedApplication().currentUserNotificationSettings()
        if grantedSettings.types.rawValue & UIUserNotificationType.None.rawValue == 0 {
            // Permissions are granted
            println("Permissions are granted")
            for (i, sign) in enumerate(signs) {
                components.month = startDates[i][0].toInt()!
                components.day = startDates[i][2...3].toInt()!
                let date = cal!.dateFromComponents(components)
                let date2 = cal!.dateByAddingComponents(oneDay, toDate: date!, options: nil)
                
                notification.alertBody = notificationMessages[i][0] + " Learn more about " + sign + "!"
                notification.fireDate = date
//                if i == 0 {
//                    notification.fireDate = testDate
//                }
                notification.soundName = UILocalNotificationDefaultSoundName
                notification.category = "ZODIAC_CATEGORY"
                notification.userInfo = ["Zodiac":i]
                notification.repeatInterval = .CalendarUnitYear
                
                UIApplication.sharedApplication().scheduleLocalNotification(notification)
                
                println("date = \(date!)")
                println("notification.alertBody = \(notification.alertBody!)")
                
            }
        }


        println("UIApplication.sharedApplication().scheduledLocalNotifications = \(UIApplication.sharedApplication().scheduledLocalNotifications)")
    }
    
//    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
//        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
//    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        createNotifications()

    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

