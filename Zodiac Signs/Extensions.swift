//
//  Extensions.swift
//  Calculator
//
//  Created by Haluk Isik on 6/17/15.
//  Copyright (c) 2015 Haluk Isik. All rights reserved.
//

import UIKit

extension NSDate
{
    var month: Int
    {
        //Get Hour
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitMonth, fromDate: self)
        let month = components.month
        
        //Return Hour
        return month
    }
    var day: Int
    {
        //Get Hour
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitDay, fromDate: self)
        let day = components.day
        
        //Return Hour
        return day
    }
    var hour: Int
    {
        //Get Hour
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitHour, fromDate: self)
        let hour = components.hour
        
        //Return Hour
        return hour
    }
    
    var minute: Int
    {
        //Get Minute
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitMinute, fromDate: self)
        let minute = components.minute
        
        //Return Minute
        return minute
    }
    
    var toShortTimeString: String
    {
        //Get Short Time String
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        let timeString = formatter.stringFromDate(self)
        
        //Return Short Time String
        return timeString
    }
}

extension Array {
    func pairs(block: (Element, Element?)->()) {
        if count == 0 { return }
        if count == 1 { block(self.first!, nil) }
        
        var last = self[0]
        for i in self[1..<count] {
            block(last, i)
            last = i
        }
    }
}

extension String
{
    var toggleMinus: String {
        if self.hasPrefix("-") {
            return dropFirst(self)
        }
        else {
            return "-" + self
        }
    }
    subscript (i: Int) -> Character {
        return self[advance(self.startIndex, i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        return substringWithRange(Range(start: advance(startIndex, r.startIndex), end: advance(startIndex, r.endIndex)))
    }
}

extension UILabel
{
    var contentSize: CGSize
    {
        let label: UILabel = UILabel(frame: CGRectMake(0, 0, super.frame.size.width, super.frame.size.height))
        label.numberOfLines = 1
        label.lineBreakMode = NSLineBreakMode.ByTruncatingHead
        label.font = self.font
        label.text = self.text ?? " "
        label.textAlignment = NSTextAlignment.Right
        
//        let label = self
        
        label.sizeToFit()
        
        return label.frame.size
    }
    
    func rightAlignWithContentSize () -> CGRect
    {
        let extraWidth = self.contentSize.width - self.frame.size.width
        let frame = CGRectMake(self.frame.origin.x - extraWidth, self.frame.origin.y, self.frame.size.width, self.frame.size.width)
        
        return frame
    }
    func makeItTemporarilyBig () -> CGRect
    {
        let extraWidth = self.frame.size.width
        let frame = CGRectMake(self.frame.origin.x - extraWidth, self.frame.origin.y, self.frame.size.width, self.frame.size.width)
        
        return frame
    }
}
extension UIColor
{
    convenience init(rgba: String) {
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = 1.0
        
        if rgba.hasPrefix("#") {
            let index   = advance(rgba.startIndex, 1)
            let hex     = rgba.substringFromIndex(index)
            let scanner = NSScanner(string: hex)
            var hexValue: CUnsignedLongLong = 0
            if scanner.scanHexLongLong(&hexValue) {
                switch (count(hex)) {
                case 3:
                    red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                    green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                    blue  = CGFloat(hexValue & 0x00F)              / 15.0
                case 4:
                    red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                    green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                    blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                    alpha = CGFloat(hexValue & 0x000F)             / 15.0
                case 6:
                    red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                    green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                    blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
                case 8:
                    red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                    green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                    blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                    alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
                default:
                    print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8")
                }
            } else {
                println("Scan hex error")
            }
        } else {
            print("Invalid RGB string, missing '#' as prefix")
        }
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}

extension UIView {
    
    func show(duration: NSTimeInterval = 1.0, delay: NSTimeInterval = 0.0, damping: CFloat = 0.5, velocity: CGFloat = 1.0, completion: ((Bool) -> Void) = {(finished: Bool) -> Void in })
    {
        let width = self.frame.size.width
        let height = self.frame.size.height
        let origin = self.frame.origin
        
        let size = self.frame.size
        self.frame.size = CGSizeZero
        
        //self.frame = CGRectMake(origin.x, origin.y + height / 2, width, 0.0)

        UIView.animateWithDuration(duration, delay: delay, usingSpringWithDamping: 0.9, initialSpringVelocity: velocity, options: nil, animations: {
            //self.frame = CGRectMake(origin.x, origin.y, width, height)
            self.frame.size = size
        }, completion: completion)
        
    
    }
    

    
}