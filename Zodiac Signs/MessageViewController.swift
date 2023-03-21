//
//  Created by Pete Callaway on 26/06/2014.
//  Copyright (c) 2014 Dative Studios. All rights reserved.
//

import UIKit


class MessageViewController: UIViewController, UIViewControllerTransitioningDelegate, UITextFieldDelegate
{
    var nameText: String? = "" {
        didSet {
            nameTextField?.text = nameText
        }
    }
    
    var friendsInSign = [[String]]()
    var selectedSignNumber = 0
    
    var birthdaysInSign = [[NSDate]]()
    
    @IBOutlet weak var nameTextField: UITextField! {
        didSet {
            nameTextField.delegate = self
            nameTextField.text = nameText
        }
    }
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func save(sender: UIButton)
    {
        let sunSign = ZodiacSigns.signFromDate(datePicker.date).sunSign
        let signNumber = ZodiacSigns.signNumberFromSunSign(sunSign)
        let birthday = datePicker.date
        let name = nameTextField.text
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        if let sign = userDefaults.objectForKey("Zodiac.friendsInSign") as? [[String]] {
            friendsInSign = sign
        } else {
            for _ in 0...11 {
                friendsInSign.append([])
            }
        }
        if let bday = userDefaults.objectForKey("Zodiac.birthdaysInSign") as? [[NSDate]] {
            birthdaysInSign = bday
        } else {
            for _ in 0...11 {
                birthdaysInSign.append([])
            }
        }
        friendsInSign[signNumber].append(name)
        birthdaysInSign[signNumber].append(birthday)
        
//        var id: Int? = userDefaults.objectForKey("Zodiac.id") as? Int
//        if id == nil { id = 0 }

//        friendsInSign[signNumber][0] = name
//        birthdays[name] = birthday
        
        userDefaults.setObject(friendsInSign, forKey: "Zodiac.friendsInSign")
        userDefaults.setObject(birthdaysInSign, forKey: "Zodiac.birthdaysInSign")
        userDefaults.synchronize()
        
        performSegueWithIdentifier("Save", sender: self)
    }
    @IBAction func dismiss(sender: UIButton) {
        dismiss()
    }
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("preparing for segue")
        var destination: AnyObject = segue.destinationViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        
        if let identifier = segue.identifier {
            switch identifier {
            case "Save":
                if let dvc: ZSDetailTableViewController = destination as? ZSDetailTableViewController {
                    println("friendsInSign = \(friendsInSign)")

                    dvc.friendsInSign = friendsInSign
                    dvc.birthdaysInSign = birthdaysInSign
                    println("dvc.friendsInSign = \(dvc.friendsInSign)")
                    dismiss()
                }
            default:
                break
            }
        }

    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == nameTextField {
            textField.resignFirstResponder()
            nameText = textField.text
        }
        return true
    }
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!)  {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        self.commonInit()
    }

    func commonInit() {
        self.modalPresentationStyle = .Custom
        self.transitioningDelegate = self
    }


    // ---- UIViewControllerTransitioningDelegate methods

    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController!, sourceViewController source: UIViewController) -> UIPresentationController? {

        if presented == self {
            return CustomPresentationController(presentedViewController: presented, presentingViewController: presenting)
        }

        return nil
    }

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        if presented == self {
            return CustomPresentationAnimationController(isPresenting: true)
        }
        else {
            return nil
        }
    }

    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        if dismissed == self {
            return CustomPresentationAnimationController(isPresenting: false)
        }
        else {
            return nil
        }
    }

    override func viewWillLayoutSubviews() {
        var frame = super.view.bounds;
        println("super.view.bounds = \(super.view.bounds)")
        
//        let containerHeight = super.view.bounds.height
//        let height, originY: CGFloat
//        
//        if containerHeight >= 500 {
//            originY = 200
//            height = containerHeight - originY
//        } else {
//            originY = 80
//            height = containerHeight - originY
//        }
//        frame = CGRectMake(20, originY, super.view.bounds.width - 40, height)
//        self.view.frame = frame
    }
}
