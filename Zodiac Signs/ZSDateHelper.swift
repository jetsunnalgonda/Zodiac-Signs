//
//  ZSDateHelper.swift
//  Zodiac Signs
//
//  Created by Haluk Isik on 12/15/14.
//  Copyright (c) 2014 Haluk Isik. All rights reserved.
//

import Foundation

extension NSDate {
    
    func isBetweenDates(beginDate: NSDate, endDate: NSDate!) -> Bool
    {
        return (self.compare(beginDate) != NSComparisonResult.OrderedAscending && self.compare(endDate) != NSComparisonResult.OrderedDescending)
            || (self.compare(beginDate) == NSComparisonResult.OrderedSame)
            || (self.compare(endDate) == NSComparisonResult.OrderedSame)
    }
    /*
    
    func dateBySettingComponents(closure: (components: NSDateComponents) -> (Void)!) -> NSDate
    {
        let comp:NSDateComponents = self.dateComponent(ZSDateComponentFlag.None, date: self, value: 0)
        closure(components: comp)
        return NSCalendar.currentCalendar().dateFromComponents(comp)!
    }
    */
    
    func truncateToDay() -> NSDate
    {
        var result = NSDate()
        
        let unitFlags: NSCalendarUnit = .YearCalendarUnit | .MonthCalendarUnit | .DayCalendarUnit
        let cal = NSCalendar.currentCalendar()
        let comps = cal.components(unitFlags, fromDate: self)
        result = cal.dateFromComponents(comps)!
        return result;
    }
}