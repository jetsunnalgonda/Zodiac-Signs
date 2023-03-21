//
//  SecondViewController.swift
//  Zodiac Signs
//
//  Created by Haluk Isik on 12/3/14.
//  Copyright (c) 2014 Haluk Isik. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var selectedSignNumber = 0
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "rotated", name: UIDeviceOrientationDidChangeNotification, object: nil)
        
        backgroundImageView.image = UIImage(named: "Sagittarius")
        backgroundImageView.backgroundColor = UIColor.clearColor()
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = backgroundImageView.bounds
        backgroundImageView.addSubview(blurEffectView) //if you have more UIViews on screen, use insertSubview:belowSubview: to place it underneath the lowest view instead
        
        //add auto layout constraints so that the blur fills the screen upon rotating device
        blurEffectView.setTranslatesAutoresizingMaskIntoConstraints(false)
        backgroundImageView.addConstraint(NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: backgroundImageView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0))
        backgroundImageView.addConstraint(NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: backgroundImageView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0))
        backgroundImageView.addConstraint(NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: backgroundImageView, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0))
        backgroundImageView.addConstraint(NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: backgroundImageView, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0))
        
    }

    func rotated()
    {
        if(UIDeviceOrientationIsLandscape(UIDevice.currentDevice().orientation))
        {
            println("landscape")
        }
        
        if(UIDeviceOrientationIsPortrait(UIDevice.currentDevice().orientation))
        {
            println("portraight")
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        //collectionView.reloadData()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("sign", forIndexPath: indexPath) as! ZSCollectionViewCell
        //cell.backgroundColor = UIColor.orangeColor()
        //cell.imageView.bounds = cell.bounds
        cell.imageView.contentMode = .ScaleAspectFit
        
        cell.imageView.image = UIImage(named: "signs_\(indexPath.row + 1)x")
        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        let smallSide = min(view.frame.width, view.frame.height)
        let largeSide = max(view.frame.width, view.frame.height)
        let aspectRatio = largeSide / smallSide
        println("aspectRatio = \(aspectRatio)")
        println("largeSide = \(largeSide)")
        println("smallSide = \(smallSide)")
        println("self.topLayoutGuide.length = \(self.topLayoutGuide.length)")
        
        let sizeSmall: CGFloat = 10
        let sizeBig: CGFloat = 30
        var size: CGFloat = 10
        
        switch aspectRatio {
        case 1.4..<1.75:
            size = sizeSmall
        case 0..<1.4:
            size = sizeBig
        default:
            println("sizeBig")
            size = sizeSmall
        }
        
        println("size = \(size)")
        return size
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        let deviceOrientation = UIDevice.currentDevice().orientation
        
        
//        let sizeRect = UIScreen.mainScreen().applicationFrame
//        let width = sizeRect.size.width-50
//        let height = sizeRect.size.height-100
        
//        let width = self.view.frame.width
//        let height =  self.view.frame.height
        
        let numberOfCells = 12
        
        let smallSide = min(view.frame.width, view.frame.height)
        let largeSide = max(view.frame.width, view.frame.height)
        let aspectRatio = largeSide / smallSide
//        let numberOfRows = ceil(CGFloat(numberOfCells) * aspectRatio)
        
        let sizeSmall = CGSizeMake((smallSide / 4) / 1.24, smallSide / 4)
        let sizeBig = CGSizeMake((largeSide / 6) / 1.24, largeSide / 6)
        let sizeBigger = CGSizeMake((smallSide / 3) / 1.24, smallSide / 3)
        var size = sizeSmall

        println("collectionView.contentSize = \(collectionView.contentSize)")
        
//        collectionView.contentSize = CGSizeMake(width - 0, height + 50)
//        collectionView.frame = CGRectMake(0, 0, width - 0, height + 50)

//        println("collectionView.contentSize = \(collectionView.contentSize)")
//        println("height = \(height), \n width = \(width)")
        println("self.view.frame = \(self.view.frame)")
        println("self.view.bounds = \(self.view.bounds)")
        
        switch aspectRatio {
        case 1.4..<1.85:
            println("sizeBig")
            size = sizeBig
        case 0..<1.4:
            println("sizeSmall")
            size = sizeSmall
        default:
            println("sizeBig")
            size = sizeBig
        }

        return size
//        return aspectRatio > 1.5 ? sizeSmall : sizeBig
//        return CGSizeMake((smallSide / 4) / 1.24, smallSide / 4)

    }

    /*
    - (CGSize)collectionView:(UICollectionView *)collectionView
    layout:(UICollectionViewLayout *)collectionViewLayout
    sizeForItemAtIndexPath:(NSIndexPath *)indexPath
    {
    // Adjust cell size for orientation
    if (UIDeviceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
    return CGSizeMake(170.f, 170.f);
    }
    return CGSizeMake(192.f, 192.f);
    }
    
    - (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
    {
    [self.collectionView performBatchUpdates:nil completion:nil];
    }
    
    */

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        selectedSignNumber = indexPath.row
        println("item selected")
        println("Selected item number = \(selectedSignNumber)")
        performSegueWithIdentifier("detailView", sender: indexPath)

    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        return false
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "detailView") {
            let vc = segue.destinationViewController as! ZSDetailTableViewController
            //let item = AnyObject
            println("In segue")

            if segue.destinationViewController.isKindOfClass(ZSDetailTableViewController) {
                println("Class matches")
                println("Selected item number again = \(selectedSignNumber)")

                vc.selectedSignNumber = selectedSignNumber
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

