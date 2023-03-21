//
//  ZodiacSigns.swift
//  Zodiac Signs
//
//  Created by Haluk Isik on 12/16/14.
//  Copyright (c) 2014 Haluk Isik. All rights reserved.
//

import UIKit

func peek<T>(interestingValue: T) -> T {
    println("interestingValue = \(interestingValue)")
    return interestingValue
}

class ZodiacSigns
{
    // MARK: - Class methods
    class func signFromDate(date: NSDate) -> ZodiacSigns
    {
        let startDates = ["3-21", "4-20", "5-21", "6-21", "7-23", "8-23", "9-23", "10-24", "11-23", "12-22", "1-01", "1-20", "2-19"]
        let endDates = ["4-19", "5-20", "6-20", "7-22", "8-22", "9-22", "10-23", "11-22", "12-21", "12-31", "1-19", "2-18", "3-20"]
        let maxDays = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        
        var selectedMonth = 0
        var selectedSignNumber = 0
        
        let month = date.month - 1
        let day = date.day - 1
        println("month = \(month)")
        println("day = \(day)")
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US")
        dateFormatter.dateFormat = "M-d-H:mm"
        let date = dateFormatter.dateFromString("\(month+1)"+"-"+"\(day+1)"+"-10:12")
        println("date = \(date)")
        //date?.truncateToDay()
        //println("after truncation - date = \(date)")
        
        for i in 0...12 {
            let startDate = dateFormatter.dateFromString("\(startDates[i])"+"-10:12")
            let endDate = dateFormatter.dateFromString("\(endDates[i])"+"-10:12")
            println("deneme \(startDate) \(endDate)")
            if (date!.isBetweenDates(startDate!, endDate: endDate)) {
//                signImage.image = UIImage(named: "signs_\(i <= 9 ? i + 1 : i)x")
                selectedSignNumber = i <= 9 ? i : i - 1
                
            }
        }
        
        return ZodiacSigns(selectedSignNumber: selectedSignNumber)
        
    }
    class func signNumberFromSunSign(sign: ZodiacSigns.SunSign) -> Int
    {
        var signNumber = 0
        for element in SunSign.all.signs {
            if element == sign {
                break
            }
            signNumber++
        }
        return signNumber
    }

    // MARK: - Properties
    
    var sunSign: SunSign
    var mode: Mode
    var element: Element
    var metal: Metal
    var stone: Stone
    var perfume: Perfume
    var plant: Plant
    var flower: Flower
    var planet: Planet
    var color: Color
    var keyword: Keyword
    var day: Day
    var ruler: Ruler
    
    
    // MARK: - SunSign
    enum SunSign: Int, Printable {
        case Aries = 0, Taurus, Gemini, Cancer, Leo, Virgo, Libra, Scorpio, Saggitarius, Capricorn, Aquarius, Pisces
        
        var description: String {
            let sunSignNames = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]
            return sunSignNames[self.rawValue]
        }
        static var all: (signs: [SunSign], descriptions: [String]) {
            var i = -1
            var all: [SunSign] = [SunSign]()
            var allDescription: [String] = [String]()
            while let _ = self(rawValue: ++i) {
                all.append(self(rawValue: i)!)
                allDescription.append(self(rawValue: i)!.description)
            }
            return (all, allDescription)
        }
        
    }
    // MARK: Mode
    enum Mode: Int, Printable {
        case Cardinal = 0, Fixed,  Mutable
        
        var description: String {
            let modeNames = ["Cardinal", "Fixed", "Mutable"]
            return modeNames[self.rawValue]
        }
        
        static var all: (modes: [Mode], descriptions: [String]) {
            var i = -1
            var all: [Mode] = [Mode]()
            var allDescription: [String] = [String]()
            while let _ = self(rawValue: ++i) {
                all.append(self(rawValue: i)!)
                allDescription.append(self(rawValue: i)!.description)
            }
            return (all, allDescription)
        }
    }
    // MARK: Element
    enum Element: Int, Printable {
        case Fire = 0, Earth, Air, Water
        
        var description: String {
            let elementNames = ["Fire", "Earth", "Air", "Water"]
            return elementNames[self.rawValue]
        }
        static var all: (elements: [Element], descriptions: [String]) {
            var i = -1
            var all: [Element] = [Element]()
            var allDescription: [String] = [String]()
            while let _ = self(rawValue: ++i) {
                all.append(self(rawValue: i)!)
                allDescription.append(self(rawValue: i)!.description)
            }
            return (all, allDescription)
        }
    }
    // MARK: Metal
    enum Metal: Int, Printable {
        case Iron = 0, Copper, Azoth, Silver, Gold, Mercury, Magnet, Tin, Lead, Aliminum_and_, Platinum_and_
        
        var description: String {
            let elementNames = ["Iron", "Copper", "Azoth", "Silver", "Gold", "Mercury", "Magnet", "Tin", "Lead", "Aluminum, Uranium and Lead", "Platinum and Tin"]
            return elementNames[self.rawValue]
        }
        static var all: (metals: [Metal], descriptions: [String]) {
            var i = -1
            var all: [Metal] = [Metal]()
            var allDescription: [String] = [String]()
            while let _ = self(rawValue: ++i) {
                all.append(self(rawValue: i)!)
                allDescription.append(self(rawValue: i)!.description)
            }
            return (all, allDescription)
        }
    }
    // MARK: Stone
    enum Stone: Int, Printable {
        case Ruby = 0, EmeraldAndAgate, GoldenBeryl, Pearl, Diamond, Emerald, Chrysolite, Topaz, BlueSapphire, Onyx, SapphirePearl, Amethyst
        
        var description: String {
            let elementNames = ["Ruby and Diamond", "Emerald and Agate", "Golden Beryl", "Pearl", "Diamond", "The Emerald", "Chrysolite", "Topaz", "Blue Sapphire", "Onyx", "Sapphire and Black Pearl", "Amethyst"]
            return elementNames[self.rawValue]
        }
        static var all: (stones: [Stone], descriptions: [String]) {
            var i = -1
            var all: [Stone] = [Stone]()
            var allDescription: [String] = [String]()
            while let _ = self(rawValue: ++i) {
                all.append(self(rawValue: i)!)
                allDescription.append(self(rawValue: i)!.description)
            }
            return (all, allDescription)
        }
    }
    // MARK: Perfume
    enum Perfume: Int, Printable {
        case Myrrh = 0, AromaticHerb, Mastic, Camphor, Frankincense, WhiteSandalwood, Galbanum, Coral, Aloe, PineExtract, Spikenard, Thyme
        
        var description: String {
            let elementNames = ["Myrrh", "Aromatic Herb", "Mastic", "Camphor", "Frankincense", "White Sandalwood", "Galbanum", "Coral", "Aloe", "PineExtract", "Spikenard", "Thyme"]
            return elementNames[self.rawValue]
        }
        static var all: (perfumes: [Perfume], descriptions: [String]) {
            var i = -1
            var all: [Perfume] = [Perfume]()
            var allDescription: [String] = [String]()
            while let _ = self(rawValue: ++i) {
                all.append(self(rawValue: i)!)
                allDescription.append(self(rawValue: i)!.description)
            }
            return (all, allDescription)
        }
    }
    // MARK: Plant
    enum Plant: Int, Printable {
        case Oak = 0, Birch, Honeysuckle, EucalyptusAnd, Sunflower, Elm, PineAnd, AmericanAgave, FalsePlantain, Centauri
        
        var description: String {
            let elementNames = ["Oak", "Birch", "Honeysuckle", "Eucalyptus, Cherry Tree, and the Violet", "Sunflower", "The Elm", "Pine and Cypress", "American Agave, Maguey", "False Plantain", "Century Plant (Maguey) and False Plantain"]
            return elementNames[self.rawValue]
        }
        static var all: (plants: [Plant], descriptions: [String]) {
            var i = -1
            var all: [Plant] = [Plant]()
            var allDescription: [String] = [String]()
            while let _ = self(rawValue: ++i) {
                all.append(self(rawValue: i)!)
                allDescription.append(self(rawValue: i)!.description)
            }
            return (all, allDescription)
        }
    }
    // MARK: Flower
    enum Flower: Int, Printable {
        case RedCarnation = 0, Thorned, Chrysanthemum, WhiteRose, Poppy, MorningGlory, Narcissus, Hydrangea, Lotus, Bellorita, Violet
        
        var description: String {
            let elementNames = ["Red Carnation", "Thorned", "Chrysanthemum", "White Rose", "Poppy", "Morning Glory", "Narcissus", "Hydrangea", "Lotus", "Bellorita", "Violet"]
            return elementNames[self.rawValue]
        }
        static var all: (flowers: [Flower], descriptions: [String]) {
            var i = -1
            var all: [Flower] = [Flower]()
            var allDescription: [String] = [String]()
            while let _ = self(rawValue: ++i) {
                all.append(self(rawValue: i)!)
                allDescription.append(self(rawValue: i)!.description)
            }
            return (all, allDescription)
        }
    }
    // MARK: Planet
    enum Planet: Int, Printable {
        case Mars = 0, Venus, Mercury, Moon, Sun, Jupiter, Saturn, Uranus, Neptune
        
        var description: String {
            let elementNames = ["Mars", "Venus", "Mercury", "Moon", "Sun", "Jupiter", "Saturn", "Uranus", "Neptune"]
            return elementNames[self.rawValue]
        }
        static var all: (planets: [Planet], descriptions: [String]) {
            var i = -1
            var all: [Planet] = [Planet]()
            var allDescription: [String] = [String]()
            while let _ = self(rawValue: ++i) {
                all.append(self(rawValue: i)!)
                allDescription.append(self(rawValue: i)!.description)
            }
            return (all, allDescription)
        }
    }
    // MARK: Color
    enum Color: Int, Printable {
        case Red = 0, Green, OrangeAnd, Silver, Golden, Yellow, Blue, Black, Violet
        
        var description: String {
            let elementNames = ["Red", "Green", "Orange and Brilliant Yellow", "Silver", "Golden", "Yellow", "Blue", "Black", "Violet"]
            return elementNames[self.rawValue]
        }
        static var all: (colors: [Color], descriptions: [String]) {
            var i = -1
            var all: [Color] = [Color]()
            var allDescription: [String] = [String]()
            while let _ = self(rawValue: ++i) {
                all.append(self(rawValue: i)!)
                allDescription.append(self(rawValue: i)!.description)
            }
            return (all, allDescription)
        }
    }
    // MARK: Keyword
    enum Keyword: Int, Printable {
        case Action = 0, Love, Reason, Fecundation, Life, Benevolence, Obstruction, Altruism, Dignity
        
        var description: String {
            let elementNames = ["Action", "Love", "Reason", "Fecundation", "Life", "Benevolence", "Obstruction", "Altruism", "Dignity"]
            return elementNames[self.rawValue]
        }
        static var all: (keywords: [Keyword], descriptions: [String]) {
            var i = -1
            var all: [Keyword] = [Keyword]()
            var allDescription: [String] = [String]()
            while let _ = self(rawValue: ++i) {
                all.append(self(rawValue: i)!)
                allDescription.append(self(rawValue: i)!.description)
            }
            return (all, allDescription)
        }
    }
    // MARK: Day
    enum Day: Int, Printable {
        case Tuesday = 0, Friday, Wednesday, Monday, Sunday, Thursday, Saturday
        
        var description: String {
            let elementNames = ["Tuesday", "Friday", "Wednesday", "Monday", "Sunday", "Thursday", "Saturday"]
            return elementNames[self.rawValue]
        }
        static var all: (days: [Day], descriptions: [String]) {
            var i = -1
            var all: [Day] = [Day]()
            var allDescription: [String] = [String]()
            while let _ = self(rawValue: ++i) {
                all.append(self(rawValue: i)!)
                allDescription.append(self(rawValue: i)!.description)
            }
            return (all, allDescription)
        }
    }
    // MARK: Ruler
    enum Ruler: Int, Printable {
        case Samael = 0, Uriel, Raphael, Gabriel, Michael, Zachariel, Orifiel, Archer, Rasamosa
        
        var description: String {
            let elementNames = ["Samael", "Uriel", "Raphael", "Gabriel", "Michael", "Zachariel", "Orifiel", "Archer and Sakmakrel", "Rasamosa and Uacabiel"]
            return elementNames[self.rawValue]
        }
        static var all: (rulers: [Ruler], descriptions: [String]) {
            var i = -1
            var all: [Ruler] = [Ruler]()
            var allDescription: [String] = [String]()
            while let _ = self(rawValue: ++i) {
                all.append(self(rawValue: i)!)
                allDescription.append(self(rawValue: i)!.description)
            }
            return (all, allDescription)
        }
    }
    // MARK: - Initialization
    init(selectedSignNumber signNumber: Int)
    {
        println("(ZodiacSigns init) signNumber = \(signNumber)")
        sunSign = SunSign.all.signs[signNumber % 12]
        element = Element.all.elements[signNumber % 4]
        mode = Mode.all.modes[signNumber % 3]
        stone = Stone.all.stones[signNumber % 12]
        perfume = Perfume.all.perfumes[signNumber % 12]
        
        if signNumber < 5 {
            metal = Metal.all.metals[signNumber]
            plant = Plant.all.plants[signNumber]
            flower = Flower.all.flowers[signNumber]
            planet = Planet.all.planets[signNumber]
            color = Color.all.colors[signNumber]
            keyword = Keyword.all.keywords[signNumber]
            day = Day.all.days[signNumber]
            ruler = Ruler.all.rulers[signNumber]

        } else if signNumber == 5 {
            metal = Metal.all.metals[signNumber]
            plant = Plant.all.plants[signNumber]
            flower = Flower.all.flowers[signNumber]
            planet = Planet.Sun
            color = Color.all.colors[signNumber]
            keyword = Keyword.Reason
            day = Day.Wednesday
            ruler = Ruler.Raphael
            
        } else if signNumber == 6 {
            metal = Metal.Copper
            plant = Plant.Oak
            flower = Flower.all.flowers[signNumber]
            planet = Planet.Mercury
            color = Color.Green
            keyword = Keyword.Love
            day = Day.Friday
            ruler = Ruler.Uriel

        } else if signNumber == 7 {
            metal = Metal.all.metals[signNumber]
            plant = Plant.all.plants[signNumber]
            flower = Flower.Chrysanthemum
            planet = Planet.Venus
            color = Color.Red
            keyword = Keyword.Action
            day = Day.Tuesday
            ruler = Ruler.Samael

        } else if signNumber == 8 {
            metal = Metal.all.metals[signNumber - 1]
            plant = Plant.all.plants[signNumber - 1]
            flower = Flower.all.flowers[signNumber - 1]
            planet = Planet.all.planets[signNumber - 3]
            color = Color.all.colors[signNumber - 2]
            keyword = Keyword.all.keywords[signNumber - 3]
            day = Day.Thursday
            ruler = Ruler.Zachariel

        } else if signNumber == 9 {
            metal = Metal.all.metals[signNumber - 1]
            plant = Plant.all.plants[signNumber - 1]
            flower = Flower.all.flowers[signNumber - 1]
            planet = Planet.all.planets[signNumber - 3]
            color = Color.all.colors[signNumber - 2]
            keyword = Keyword.all.keywords[signNumber - 3]
            day = Day.Saturday
            ruler = Ruler.Orifiel

        } else if signNumber == 10 {
            metal = Metal.all.metals[signNumber - 1]
            plant = Plant.PineAnd
            flower = Flower.all.flowers[signNumber - 1]
            planet = Planet.all.planets[signNumber - 3]
            color = Color.Green
            keyword = Keyword.all.keywords[signNumber - 3]
            day = Day.Saturday
            ruler = Ruler.Archer

        } else {
            metal = Metal.all.metals[signNumber - 1]
            plant = Plant.Centauri
            flower = Flower.all.flowers[signNumber - 1]
            planet = Planet.all.planets[signNumber - 3]
            color = Color.all.colors[signNumber - 3]
            keyword = Keyword.all.keywords[signNumber - 3]
            day = Day.Thursday
            ruler = Ruler.Rasamosa

        }
//        zodiacSignByNumber(signNumber)
    }
    
    convenience init(signWithName signName: String)
    {
        var number = 0
        for (index, sign) in enumerate(SunSign.all.descriptions) {
            if signName == sign { number = index }
        }
        self.init(selectedSignNumber: number)
    }
    convenience init(sunSign: SunSign)
    {
        var number = 0
        for (index, sign) in enumerate(SunSign.all.signs) {
            if sunSign == sign { number = index }
        }
        self.init(selectedSignNumber: number)
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
