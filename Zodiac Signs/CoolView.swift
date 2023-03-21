//
//  CoolView.swift
//  Zodiac Signs
//
//  Created by Haluk Isik on 7/19/15.
//  Copyright (c) 2015 Haluk Isik. All rights reserved.
//

import UIKit

class CoolView: UIView {

//    override func drawRect(rect: CGRect) {
//        var frame = self.bounds;
//        frame = CGRectInset(frame, 1.0, 1.0)
//        let c = UIGraphicsGetCurrentContext()
////        CGContextAddRect(c, CGRectMake(10, 10, 80, 80))
//        CGContextSetStrokeColorWithColor(c , UIColor.lightGrayColor().CGColor)
//        CGContextAddRect(c, frame)
//        CGContextStrokePath(c)
//    }

    override func layoutSubviews() {
        // border radius
        self.layer.cornerRadius = 8
        
        // border
        self.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.layer.borderWidth = 0.5
        
        // drop shadow
//        self.layer.shadowColor = UIColor.redColor().CGColor
//        self.layer.shadowOpacity = 0.8
//        self.layer.shadowRadius = 3.0
//        self.layer.shadowOffset = CGSizeMake(2.0, 2.0)

    }
}
