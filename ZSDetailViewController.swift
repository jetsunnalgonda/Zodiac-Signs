//
//  ZSDetailViewController.swift
//  Zodiac Signs
//
//  Created by Haluk Isik on 12/16/14.
//  Copyright (c) 2014 Haluk Isik. All rights reserved.
//

import UIKit

class ZSDetailViewController: UIViewController {
    
    var selectedSignNumber = 0
    var selectedSign:ZodiacSigns

    /*
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        selectedSign = 0
        super.init()
    }
    */
    
    required init(coder aDecoder: NSCoder) {
        selectedSignNumber = 0
        selectedSign = ZodiacSigns(selectedSignNumber: 0)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        selectedSign = ZodiacSigns(selectedSignNumber: selectedSignNumber)

        title = "\(selectedSign.sunSign)"
        println("Selected sign = \(selectedSign.sunSign)")
        println("Selected sign element = \(selectedSign.element)")
        println("Selected sign metal = \(selectedSign.metal)")
        println("Selected sign stone = \(selectedSign.stone)")
        println("Selected sign mode = \(selectedSign.mode)")
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
