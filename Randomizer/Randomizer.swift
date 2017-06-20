//
//  Randomizer.swift
//  Randomizer
//
//  Created by Laptop on 6/19/17.
//  Copyright © 2017 Armonia. All rights reserved.
//

import Cocoa
import Foundation

class Random {
    static let randomMax = Double(UInt32.max)
    
    // let str = Random.string(10)
    // let str = Random.string(10, caps: true)
    static func string(_ n: Int, caps: Bool = false) -> String {
        let chars = caps ? "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" : "abcdefghijklmnopqrstuvwxyz"
        let text  = (0..<n).map { _ -> String in
            let rnd = Random.int(from: 0, to: chars.count)
            return String(chars[chars.index(chars.startIndex, offsetBy: rnd)])
        }
        
        return text.joined()
    }
    
    // let num = Random.int(10)
    // let num = Random.int(from: 1, to: 100)
    static func int(_ n: Int) -> Int {
        return int(from: 0, to: n)
    }
    
    static func int(from: Int = 0, to: Int = 9) -> Int {
        return Int(arc4random_uniform(UInt32(to)))
    }
    
    // let num = Random.double(99.99)
    // let num = Random.double(from: 0.0, to: 99.99)
    static func double(_ n: Double) -> Double {
        return double(from: 0.0, to: n)
    }
    
    static func double(from: Double = 0.00, to: Double = 9.99, dec: Int = 2) -> Double {
        let p10 = pow(Double(10),Double(dec))
        let max = Int(to * p10)
        let num = Int(arc4random_uniform(UInt32(max)))
        let dbl = Double(num) / p10
        let rnd = round((from + dbl) * p10) / p10
        
        return rnd
    }
    
    // let num = Random.float(99.99)
    // let num = Random.float(from: 0.0, to: 99.99)
    static func float(_ n: Float) -> Float {
        return float(from: 0.0, to: n)
    }
    
    static func float(from: Float = 0.00, to: Float = 9.99, dec: Int = 2) -> Float {
        let p10 = pow(Float(10),Float(dec))
        let max = Int(to * p10)
        let num = Int(arc4random_uniform(UInt32(max)))
        let dbl = Float(num) / p10
        let rnd = round((from + dbl) * p10) / p10
        
        return rnd
    }
    
    // let day = Random.date()
    // let day = Random.date(from: 1920)
    // let day = Random.date(from: Date.epoch)
    // let day = Random.date(from: Date.yearIni, to: Date.today)
    static func date(from year: Int) -> Date {
        let com = DateComponents(year: year, month: 1, day: 1)
        let ini = Calendar.current.date(from: com)!
        let day = date(from: ini, to: Date.today)
        
        return day
    }
    
    static func date(from: Date = Date.yearIni, to: Date = Date.today) -> Date {
        let diff = to.timeIntervalSince(from)
        let num = Int(arc4random_uniform(UInt32(diff)))
        let day = Date(timeInterval: TimeInterval(num), since: from)
        
        return day
    }
    
    // let ok = Random.bool()
    // let ok = Random.bool(probability: 25) 25% probability
    static func bool(probability: Int = 50) -> Bool {
        let num = Int(arc4random_uniform(UInt32(100)))
        return num > (99 - probability)
    }
    
    // let name = Random.name()
    static func name() -> String {
        let femaleNames = ["Addison", "Alexandra", "Alexis", "Allison", "Alyssa", "Arianna", "Ashley", "Bailey", "Blake", "Brianna", "Britney", "Carrie", "Charlotte", "Cheryl", "Christian", "Claire", "Courtney", "Drew", "Emma", "Evan", "Evelyn", "Fanny", "Gabriella", "Gladys", "Hailey", "Jasmine", "Jennifer", "Joyce", "Kaelyn", "Kassie", "Kelly", "Kim", "Lauren", "Leigh", "Lina", "London", "Maya", "Megan", "Melanie", "Mia", "Morgan", "Olivia", "Rachel", "Rose", "Shelley", "Sophie", "Stella", "Taylor", "Tonya", "Tracy"]
        let maleNames   = ["Andrew", "Austin", "Bernard", "Blake", "Brandon", "Brian", "Casey", "Charles", "Christian", "Collin", "Donald", "Eliyah", "Evan", "George", "Gerard", "Hansen", "Harry", "Hunter", "Irving", "Isaac", "Jackson", "Jacob", "James", "Jim", "John", "Joseph", "Joshua", "Keith", "Landon", "Leo", "Logan", "London", "Lucca", "Michael", "Milo", "Morgan", "Murray", "Nathan", "Noel", "Nolan", "Peter", "Ray", "Rudolph", "Scott", "Sean", "Taylor", "Thomas", "William", "Wyatt", "Zachary"]
        let lastNames   = ["Adams", "Allen", "Anderson", "Bailey", "Baker", "Barnes", "Bell", "Bennett", "Brooks", "Brown", "Butler", "Campbell", "Carter", "Clark", "Collins", "Cook", "Cooper", "Cox", "Cruz", "Davis", "Diaz", "Edwards", "Evans", "Fisher", "Flores", "Foster", "Garcia", "Gomez", "Gonzalez", "Gray", "Green", "Gutierrez", "Hall", "Harris", "Hernandez", "Hill", "Howard", "Hughes", "Jackson", "James", "Jenkins", "Johnson", "Jones", "Kelly", "King", "Lee", "Lewis", "Long", "Lopez", "Martin", "Martinez", "Miller", "Mitchell", "Moore", "Morales", "Morgan", "Morris", "Murphy", "Myers", "Nelson", "Nguyen", "Ortiz", "Parker", "Perez", "Perry", "Peterson", "Phillips", "Powell", "Price", "Ramirez", "Reed", "Reyes", "Richardson", "Rivera", "Roberts", "Robinson", "Rodriguez", "Rogers", "Ross", "Russell", "Sanchez", "Sanders", "Scott", "Smith", "Stewart", "Sullivan", "Taylor", "Thomas", "Thompson", "Torres", "Turner", "Walker", "Ward", "Watson", "White", "Williams", "Wilson", "Wood", "Wright", "Young"]
        let firstNames  = femaleNames + maleNames
        
        let first = Int(arc4random_uniform(UInt32(100)))
        let last  = Int(arc4random_uniform(UInt32(100)))
        let name = "\(firstNames[first]) \(lastNames[last])"
        return name
    }
    
    // let city = Random.city()
    static func city() -> String {
        let cities = ["Albuquerque", "Anaheim", "Anchorage", "Arlington", "Atlanta", "Aurora", "Austin", "Bakersfield", "Baltimore", "Baton Rouge", "Birmingham", "Boise", "Boston", "Buffalo", "Chandler", "Charlotte", "Chesapeake", "Chicago", "Chula Vista", "Cincinnati", "Cleveland", "Colorado Springs", "Columbus", "Corpus Christi", "Dallas", "Denver", "Detroit", "Durham", "El Paso", "Fort Wayne", "Fort Worth", "Fremont", "Fresno", "Garland", "Gilbert Town", "Glendale", "Greensboro", "Henderson", "Hialeah", "Honolulu", "Houston", "Indianapolis", "Irvine", "Irving", "Jacksonville", "Jersey ", "Kansas ", "Laredo", "Las Vegas", "Lexington", "Lincoln", "Long Beach", "Los Angeles", "Louisville", "Lubbock", "Madison", "Memphis", "Mesa", "Miami", "Milwaukee", "Minneapolis", "Nashville", "New Orleans", "New York", "Newark", "Norfolk", "Oakland", "Oklahoma ", "Omaha", "Orlando", "Philadelphia", "Phoenix", "Pittsburgh", "Plano", "Portland", "Raleigh", "Reno", "Riverside", "Sacramento", "San Antonio", "San Bernardino", "San Diego", "San Francisco", "San Jose", "Santa Ana", "Scottsdale", "Seattle", "St. Louis", "St. Paul", "St. Petersburg", "Stockton", "Tampa", "Toledo", "Tucson", "Tulsa", "Virginia Beach", "Washington", "Wichita", "Winston"]
        let index = Random.int(cities.count)
        
        return cities[index]
    }
    
    // let state = Random.state(short: true)
    static func state(short: Bool = false) -> String {
        let states   = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
        let states2  = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
        let index    = Random.int(50)
        
        if short { return states2[index] }
        else { return states[index] }
    }
    
    // let (city, state) = Random.cityState()
    static func cityState() -> (String, String) {
        // Returns a pair of (city,state)
        let capitals = ["AL": "Montgomery", "AK": "Juneau", "AZ": "Phoenix", "AR": "Little Rock", "CA": "Sacramento", "CO": "Denver", "CT": "Hartford", "DE": "Dover", "FL": "Tallahassee", "GA": "Atlanta", "HI": "Honolulu", "ID": "Boise", "IL": "Springfield", "IN": "Indianapolis", "IA": "Des Moines", "KS": "Topeka", "KY": "Frankfort", "LA": "Baton Rouge", "ME": "Augusta", "MD": "Annapolis", "MA": "Boston", "MI": "Lansing", "MN": "Saint Paul", "MS": "Jackson", "MO": "Jefferson City", "MT": "Helena", "NE": "Lincoln", "NV": "Carson City", "NH": "Concord", "NJ": "Trenton", "NM": "Santa Fe", "NY": "Albany", "NC": "Raleigh", "ND": "Bismarck", "OH": "Columbus", "OK": "Oklahoma City", "OR": "Salem", "PA": "Harrisburg", "RI": "Providence", "SC": "Columbia", "SD": "Pierre", "TN": "Nashville", "TX": "Austin", "UT": "Salt Lake City", "VT": "Montpelier", "VA": "Richmond", "WA": "Olympia", "WV": "Charleston", "WI": "Madison", "WY": "Cheyenne"]
        let state    = Random.state(short: true)
        let city     = capitals[state] ?? "?"
        
        return (city, state)
    }
    
    // let address = Random.address()
    static func address(full: Bool = false) -> String {
        // Returns an Address object with line1, optional city, state, zip
        let part1 = Random.int(from: 100, to: 15000)
        let part2 = ["NE", "NW", "SE", "SW"][Random.int(4)]
        let part3 = Random.int(from: 1, to: 120)
        let part4 = ["AV", "ST", "CT", "LN", "TR"][Random.int(5)]
        let line1 = "\(part1) \(part2) \(part3) \(part4)"
        if full {
            let (city, state) = Random.cityState()
            let zip = Random.int(from: 1001, to: 99999)
            return line1 + ", \(city) \(state) \(zip)"
        }
        return line1
    }
    
    // let phone = Random.phone()
    static func phone() -> String {
        let area  = Random.int(from:  100, to: 999)
        let part1 = Random.int(from:  100, to: 999)
        let part2 = Random.int(from: 1000, to: 9999)
        return "(\(area)) \(part1)-\(part2)"
    }
    
    // let salary = Random.salary()
    // let salary = Random.salary(from: Double, to: Double, multiple: 50)
    static func salary(from: Double = 10000.00, to: Double = 99999.99, dec: Int = 2, multiple: Double = 50.0) -> Double {
        let p10 = pow(Double(10), Double(dec))
        let max = Int(to * p10)
        let num = Int(arc4random_uniform(UInt32(max)))
        let dbl = Double(num) / p10
        let rnd = round((from + dbl) * p10) / p10
        
        return rnd.multiple(multiple)
    }

    // let email = Random.email()
    static func email() -> String {
        let name = Random.name().replacingOccurrences(of: " ", with: "").lowercased()
        let provider = ["gmail.com", "yahoo.com", "hotmail.com", "icloud.com", "me.com", "protonmail.com", "mailinator.com"][Random.int(7)]
        return "\(name)@\(provider)"
    }
    
    // let color = Random.color()
    static func color() -> NSColor {
        return NSColor(red: CGFloat(int(255))/255, green: CGFloat(int(255))/255, blue: CGFloat(int(255))/255, alpha: 1.0)
    }
    
}

class RandomList {
    
    var count: Int = 10
    
    init(_ n: Int = 10) {
        self.count = n
    }
    
    let randomMax = Double(UInt32.max)

    // let str = RandomList(10).string(10)
    // let str = RandomList(10).string(10, caps: true)
    func string(_ n: Int, caps: Bool = false) -> [String] {
        return (0..<count).map{ _ in Random.string(n, caps: caps) }
    }

    // let list = RandomList(10).int(100)
    // let list = RandomList(10).int(count: 10, from: 0, to: 100)
    func int(_ max: Int) -> [Int] {
        return int(from: 0, to: max)
    }
    
    func int(from: Int = 0, to: Int = 9) -> [Int] {
        return (0..<count).map{ _ in Random.int(from: from, to: to) }
    }
    
    // let list = RandomList(10).double(100.00)
    // let list = RandomList(10).double(from: 0.0, to: 99.9999, dec: 4)
    func double(_ max: Double) -> [Double] {
        return double(from: 0.0, to: max)
    }
    
    func double(from: Double = 0.00, to: Double = 9.99, dec: Int = 2) -> [Double] {
        return (0..<count).map{ _ in Random.double(from: from, to: to) }
    }
    
    // let list = RandomList(10).float(100.00)
    // let list = RandomList(10).float(from: 0.0, to: 99.9999, dec: 4)
    func float(_ max: Float) -> [Float] {
        return float(from: 0.0, to: max)
    }
    
    func float(from: Float = 0.00, to: Float = 9.99, dec: Int = 2) -> [Float] {
        return (0..<count).map{ _ in Random.float(from: from, to: to, dec: dec) }
    }
    
    // let day = RandomList(10).date()
    // let day = RandomList(10).date(from: 1920)
    // let day = RandomList(10).date(from: Date.epoch)
    // let day = RandomList(10).date(from: Date.yearIni, to: Date.today)
    func date() -> [Date] {
        return date(from: 1900)
    }

    func date(from year: Int = 1900) -> [Date] {
        return (0..<count).map{ _ in Random.date(from: year) }
    }
    
    func date(from: Date = Date.yearIni, to: Date = Date.today) -> [Date] {
        var list = [Date](repeating: Date(), count: count)
        let diff = to.timeIntervalSince(from)
        
        for index in 0..<count {
            let num = Int(arc4random_uniform(UInt32(diff)))
            let day = Date(timeInterval: TimeInterval(num), since: from)
            list[index] = day
        }
        
        return list
    }
    
    // let list = RandomList(10).bool()
    func bool() -> [Bool] {
        return (0..<count).map{ _ in Random.bool() }
    }
    
    // let list = RandomList(10).name()
    func name() -> [String] {
        return (0..<count).map{ _ in Random.name() }
    }
    
    // let list = RandomList(10).city()
    func city() -> [String] {
        return (0..<count).map{ _ in Random.city() }
    }
    
    // let list = RandomList(10).state()
    func state() -> [String] {
        return (0..<count).map{ _ in Random.state() }
    }
    
    // let list = RandomList(10).email()
    func phone() -> [String] {
        return (0..<count).map{ _ in Random.phone() }
    }
    
    // let list = RandomList(10).email()
    func email() -> [String] {
        return (0..<count).map{ _ in Random.email() }
    }
    
    // let list = RandomList(10).salary()
    func salary(from: Double = 10000.00, to: Double = 99999.99, dec: Int = 2) -> [Double] {
        return (0..<count).map{ _ in Random.salary(from: from, to: to, dec: dec) }
    }

    // let list = RandomList(10).color()
    func color() -> [NSColor] {
        return (0..<count).map{ _ in Random.color() }
    }
    
}


extension Date {
    var date: String {
        let text = String(describing: self)
        return text.substring(to: text.index(text.startIndex, offsetBy: 10))
    }
    static var today: Date { return Date() }
    static var epoch: Date { return Date(timeIntervalSince1970: 0) }
    static var year:  Int  { return Calendar.current.dateComponents([.year], from: Date()).year! }
    static var yearIni: Date { return Calendar.current.date(from: Calendar.current.dateComponents([.year], from: Date()))! }
    init(_ year: Int, _ month: Int, _ day: Int) {
        let parts = DateComponents(year: year, month: month, day: day)
        self = Calendar.current.date(from: parts)!
    }
}

extension Double {
    func multiple(_ multiple: Double) -> Double {
        return Double(Int(self / multiple)) * multiple
    }
}

extension Int {
    func multiple(_ multiple: Int) -> Int {
        return Int(Double(self) / Double(multiple)) * multiple
    }
}

extension String {
    var count: Int { return characters.count }
}

extension NSColor {
    var hex: String {
        var rr: CGFloat = 0
        var gg: CGFloat = 0
        var bb: CGFloat = 0
        var aa: CGFloat = 0
        
        getRed(&rr, green: &gg, blue: &bb, alpha: &aa)
        let rgb: Int = (Int)(rr*255)<<16 | (Int)(gg*255)<<8 | (Int)(bb*255)<<0
        
        return String(format:"#%06x", rgb)
    }
}

// End
