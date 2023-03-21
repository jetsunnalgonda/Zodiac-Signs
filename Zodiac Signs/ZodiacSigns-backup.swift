//
//  ZodiacSigns.swift
//  Zodiac Signs
//
//  Created by Haluk Isik on 12/16/14.
//  Copyright (c) 2014 Haluk Isik. All rights reserved.
//

import UIKit

class ZodiacSigns {

    
    var sunSign: String?
    var element: String?
    var mode: String?
    
    var rules, metal, stone, plant, flower, planet, color, keyword: String?
    
    static private let elementNames = ["Fire", "Earth", "Air", "Water"]
//    Rules: The Head
//    Metal: Iron
//    Stone: Ruby and Diamond
//    Perfume: Myrrh
//    Plant: Oak
//    Flower: Red Carnation
//    Planet: Mars
//    Color: Red
//    Element: Fire
//    Keyword: Action
//    Day: Tuesday
//    Ruler: Samael
    
    enum SunSign: String {
        case Aries = "Aries"
        case Taurus = "Taurus"
        case Gemini = "Gemini"
        case Cancer = "Cancer"
        case Leo = "Leo"
        case Virgo = "Virgo"
        case Libra = "Libra"
        case Scorpio = "Scorpio"
        case Saggitarius = "Saggitarius"
        case Capricorn = "Capricorn"
        case Aquarius = "Aquarius"
        case Pisces = "Pisces"
    }
    
    enum Mode: String {
        case Cardinal = "Cardinal"
        case Fixed = "Fixed"
        case Mutable = "Mutable"
    }
    enum Element: String {
        case Fire = "Fire"
        case Earth = "Earth"
        case Air = "Air"
        case Water = "Water"
        
        func elementName() -> String
        {
            return "q"
        }
        var name: String {
            switch self {
            case .Fire:
                return elementNames[0]
            case .Earth:
                return elementNames[1]
            case .Air:
                return elementNames[2]
            case .Water:
                return elementNames[3]
            }
        }
    }
    
    init(selectedSignNumber: Int)
    {
//        let modes: [Mode] = [.Cardinal, .Fixed, .Mutable]
//        let elements: [Element] = [.Fire, .Earth, .Air, .Water]
//        let sunSigns: [SunSign] = [.Aries, .Taurus, .Gemini, .Cancer, .Leo, .Virgo, .Libra, .Scorpio, .Saggitarius, .Capricorn, .Aquarius, .Pisces]

        let sunSigns = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Saggitarius", "Capricorn", "Aquarius", "Pisces"]
        let elements = ["Fire", "Earth", "Air", "Water"]
        let modes = ["Cardinal", "Fixed", "Mutable"]

        sunSign = sunSigns[selectedSignNumber]
        element = ZodiacSigns.elementNames[selectedSignNumber%4]
        mode = elements[selectedSignNumber%3]

//        zodiacSignByNumber(selectedSignNumber)
    }
    
    private func zodiacSignByNumber(signNumber: Int)
    {
        switch signNumber {
        case 0:
//            self.rules = "The Head"
            break
        default:
            break
        }
    }
}
