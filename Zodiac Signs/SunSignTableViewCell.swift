//
//  SunSignTableViewCell.swift
//  Zodiac Signs
//
//  Created by Haluk Isik on 7/11/15.
//  Copyright (c) 2015 Haluk Isik. All rights reserved.
//

import UIKit

class SunSignTableViewCell: UITableViewCell
{
    var sunSign: ZodiacSigns.SunSign? {
        didSet {
            updateUI()
        }
    }
    var height: CGFloat {
        var calculatedHeight: CGFloat = 0.0
        if let sunSign = self.sunSign {
            if let imageView = topImageView {
                calculatedHeight = imageView.frame.size.height
            }
            println("textView.frame.size.height 1 = \(textView.frame.size.height)")
            textView.sizeToFit()
            calculatedHeight += textView.frame.size.height
            println("textView.frame.size.height 2 = \(textView.frame.size.height)")

        }
        
        return calculatedHeight
    }

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI()
    {
        topImageView?.image = nil
        backgroundImageView?.image = nil
        backgroundImageView?.subviews.map { $0.removeFromSuperview() }
        textView?.text = nil
        if let sunSign = self.sunSign {
            topImageView.image = UIImage(named: sunSign.description)
            backgroundImageView.image = UIImage(named: sunSign.description)
            switch sunSign.description {
                case "Aries":
                textView.text = "Aries (♈) /ˈɛəriːz/ (meaning \"ram\") is the first astrological sign in the Zodiac, spanning the first 30 degrees of celestial longitude (0°≤ λ <30º). Under the tropical zodiac, the Sun transits this sign between March 21 and April 19 each year. The symbol of the ram is based on the Chrysomallus, the flying ram that provided the Golden Fleece. \n\nIndividuals born during these dates, depending on which system of astrology they subscribe to, may be called Arians or Ariens."
                case "Taurus":
                textView.text = "Taurus (Latin for \"the Bull\"; symbol: Taurus.svg, Unicode: ♉) is the second astrological sign in the present Zodiac. It spans the 30-60th degree of the zodiac, between 27.25 and 54.75 degree of celestial longitude. Under the tropic zodiac, the Sun transits this area on average between April 20 and May 20 each year. People born between these dates, depending on which system of astrology they subscribe to, may be called Taureans. The symbol of the bull is based on the Cretan Bull, the white bull that fathered the Minotaur and was killed by Theseus."
                case "Gemini":
                textView.text = "Gemini (pronunciation: /ˈdʒɛmɪnaɪ/ or /ˈdʒɛmɪniː/ jem-in-eye or jem-in-ee) (♊) is the third astrological sign in the Zodiac, originating from the constellation of Gemini. Under the tropical zodiac, the sun transits this sign between May 21 and June 21. The symbol of the twins is based on the Dioscuri, two mortals that were granted shared godhood after death."
                case "Cancer":
                textView.text = "Cancer (♋) is the fourth astrological sign, which is associated with the constellation Cancer. It spans the 90-120th degree of the zodiac, between 90 and 125.25 degree of celestial longitude. Under the tropical zodiac, the Sun transits this area on average between June 21 and July 22. A person under this sign is called a Moon child. The symbol of the crab is based on the Karkinos, a giant crab that harassed Hercules during his fight with the Hydra."
                case "Leo":
                textView.text = "Leo (♌) is the fifth astrological sign of the zodiac, originating from the constellation of Leo. It spans the 120-150th degree of the Tropical zodiac, between 125.25 and 152.75 degree of celestial longitude. Under the tropical zodiac, the Sun transits this area on average between July 23 and August 22 each year. The symbol of the lion is based on the Nemean Lion, a lion with an impenetrable hide. Leo is followed by the Sixth astrological sign of the zodiac Virgo."
                case "Virgo":
                    textView.text = "Virgo (♍) is the sixth astrological sign in the Zodiac. Virgo is the second-largest constellation. It spans the 150-180th degree of the zodiac, between 152.75 and 180 degree of celestial longitude. Under the tropical zodiac, the Sun transits this area on average between August 23 and September 22. Individuals born during these dates, depending on which system of astrology they subscribe to, may be called Virgos or Virgoans. The symbol of the maiden is based on Astraea. She was the last immortal to abandon Earth at the end of the Silver Age, when the gods fled to Olympus – hence the sign's association with Earth."
                case "Libra":
                    textView.text = "Libra (♎) is the seventh astrological sign in the Zodiac. It spans the 180–210th degree of the zodiac, between 180 and 207.25 degree of celestial longitude. Under the tropical zodiac, Sun transits this area on average between (northern autumnal equinox) September 23 and October 22. The symbol of the scales is based on the Scales of Justice held by Themis, the Greek personification of divine law and custom. She became the inspiration for modern depictions of Lady Justice."
                case "Scorpio":
                    textView.text = "Scorpio (♏) (Greek: Σκορπιός, Skorpios; Latin: Scorpius) is the eighth astrological sign in the Zodiac. It spans the 210–240th degree of the zodiac, between 207.25 and 234.75 degree of celestial longitude. Under the tropic zodiac, the sun transits this area on average between October 23 and November 22. Depending on which zodiac system one uses, an individual born under the influence of Scorpio may be called a Scorpio or a Scorpion. The symbol of the scorpion is based on Scorpius, a giant scorpion sent by Gaia to kill Orion."
                case "Sagittarius":
                    textView.text = "Sagittarius (♐) (Greek: Τοξότης, \"Toxotes\", Latin: \"Sagittarius\") is the ninth astrological sign, which is associated with the constellation Sagittarius. Under the tropical zodiac, the sun transits this sign between November 23 and December 21. The symbol of the archer is based on the centaur Chiron, who mentored Achilles in archery.\n\nSagittarius, half human and half-horse, is the centaur of mythology, the learned healer who forms a bridge between human beings and beasts. Also known as the Archer, Sagittarius is represented by the symbol of an arrow."
                case "Capricorn":
                    textView.text = "Capricorn (♑)(/kæp.rɪ.kɔːn/) is the tenth astrological sign in the zodiac, originating from the constellation of Capricornus. It spans the 270–300th degree of the zodiac, corresponding to celestial longitude. Under the tropical zodiac, the sun transits this area from December 22 to January 19 each year  Its symbol is based on the Sumerian primordial god of wisdom and waters, Enki with the head and upper body of a mountain goat, and the lower body and tail of a fish. Later known as Ea in Akkadian and Babylonian mythology, Enki was the god of intelligence (gestú, literally \"ear\"),creation, crafts;magic;water,seawater and lakewater(a, aba, ab)."
                case "Aquarius":
                    textView.text = "Aquarius (♒) (Greek: Ύδροχόος, \"Hydrokhoös\", Latin: \"Aquārius\") is the eleventh astrological sign in the Zodiac, originating from the constellation Aquarius.\nThe water carrier represented by the zodiacal constellation Aquarius is Ganymede, a beautiful Phrygian youth. Ganymede was the son of Tros, king of Troy (according to Lucian, he was also son of Dardanus). While tending his father's flocks on Mount Ida, Ganymede was spotted by Jupiter. The king of gods became enamored of the boy and flew down to the mountain in the form of a large bird, whisking Ganymede away to the heavens. Ever since, the boy has served as cupbearer to the gods. Ovid has Orpheus sing the tale:\n\"The king of the gods was once fired with love for Phrygian Ganymede, and when that happened Jupiter found another shape preferable to his own. Wishing to turn himself into a bird, he none the less scorned to change into any save that which can carry his thunderbolts. Then without delay, beating the air on borrowed pinions, he snatched away the shepherd of Ilium, who even now mixes the winecups, and supplies Jove with nectar, to the annoyance of Juno\" (Metamorphoses X 154-160)."
                case "Pisces":
                    textView.text = "Pisces (♓) (/ˈpaɪsiːz/, pis'eez; Ancient Greek: Ἰχθύες, \"Ikhthues\") is the twelfth astrological sign in the Zodiac, originating from the Pisces constellation. It spans the 330° to 360° of the zodiac, between 332.75° and 360° of celestial longitude. Under the tropical zodiac the sun transits this area on average between February 19 and March 20. The symbol of the fishes is derived from the ichthyocentaurs, who aided Aphrodite when she was born from the sea."
            default:
                break
                
            }

            
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

    }

}
