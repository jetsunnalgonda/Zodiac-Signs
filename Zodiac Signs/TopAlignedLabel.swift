//
//  TopAlignedLabel.swift
//  Zodiac Signs
//
//  Created by Haluk Isik on 7/14/15.
//  Copyright (c) 2015 Haluk Isik. All rights reserved.
//

import UIKit

//@IBDesignable
class TopAlignedLabel: UILabel {
    override func drawTextInRect(rect: CGRect) {
        if let stringText = text {
            let stringTextAsNSString = stringText as NSString
            var labelStringSize = stringTextAsNSString.boundingRectWithSize(CGSizeMake(CGRectGetWidth(self.frame), CGFloat.max),
                options: NSStringDrawingOptions.UsesLineFragmentOrigin,
                attributes: [NSFontAttributeName: font],
                context: nil).size
            super.drawTextInRect(CGRectMake(0, 0, CGRectGetWidth(self.frame), ceil(labelStringSize.height)))
        } else {
            super.drawTextInRect(rect)
        }
    }
//    override func prepareForInterfaceBuilder() {
//        super.prepareForInterfaceBuilder()
//        layer.borderWidth = 1
//        layer.borderColor = UIColor.blackColor().CGColor
//    }
}
