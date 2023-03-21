//
//  ZSNavigationController.swift
//  Zodiac Signs
//
//  Created by Haluk Isik on 12/17/14.
//  Copyright (c) 2014 Haluk Isik. All rights reserved.
//

import UIKit

class ZSNavigationController: UINavigationController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        self.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.translucent = true
        
        self.navigationBar.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
        */
//        var navigationBarAppearace = UINavigationBar.appearance()
//        navigationBar.barTintColor = UIColor(rgba: "#aabbff80")
        
        //navigationBarAppearace.tintColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)//UIColorFromHex(0xffffff, alpha: 0.5)
        //navigationBarAppearace.barTintColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)//UIColorFromHex(0x034517, alpha: 0.5)
        // change navigation item title color
        //navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        
        
        // Do any additional setup after loading the view.
        var navigationBarAppearance = UINavigationBar.appearance()
        
        navigationBarAppearance.titleTextAttributes = [ NSFontAttributeName: zodiacFont,  NSForegroundColorAttributeName: zodiacColor]

        navigationBar.tintColor = zodiacColor
        
        self.tabBarController?.tabBar.tintColor = zodiacColor
    }
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
