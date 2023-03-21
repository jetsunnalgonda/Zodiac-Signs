//
//  ZSCollectionViewLayout.swift
//  Zodiac Signs
//
//  Created by Haluk Isik on 12/16/14.
//  Copyright (c) 2014 Haluk Isik. All rights reserved.
//

import UIKit

class ZSCollectionViewLayout: UICollectionViewLayout {
    override func collectionViewContentSize() -> CGSize {
        let deviceOrientation = UIDevice.currentDevice().orientation
        let sizeRect = UIScreen.mainScreen().applicationFrame
        let width = sizeRect.size.width
        let height = sizeRect.size.height-100
        
        if (UIDeviceOrientationIsLandscape(deviceOrientation)) {
            //collectionView.bounds.width / 4
            return CGSizeMake(width, height)
        }
        return CGSizeMake(width, height)
    }
}
