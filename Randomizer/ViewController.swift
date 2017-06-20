//
//  ViewController.swift
//  Randomizer
//
//  Created by Laptop on 6/19/17.
//  Copyright © 2017 Armonia. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var textString: NSTextField!
    @IBOutlet weak var textInteger: NSTextField!
    @IBOutlet weak var textDouble: NSTextField!
    @IBOutlet weak var textDate: NSTextField!
    @IBOutlet weak var textName: NSTextField!
    @IBOutlet weak var textCity: NSTextField!
    @IBOutlet weak var textState: NSTextField!
    @IBOutlet weak var textSalary: NSTextField!
    @IBOutlet weak var textBool: NSTextField!
    @IBOutlet weak var checkCaps: NSButton!
    
    @IBOutlet var textList: NSTextView!
    
    @IBAction func buttonString(_ sender: Any)  { randString(); listString() }
    @IBAction func buttonInteger(_ sender: Any) { randInteger(); listInteger() }
    @IBAction func buttonDouble(_ sender: Any)  { randDouble(); listDouble() }
    @IBAction func buttonDate(_ sender: Any)    { randDate(); listDate() }
    @IBAction func buttonName(_ sender: Any)    { randName(); listName() }
    @IBAction func buttonCity(_ sender: Any)    { randCity(); listCity() }
    @IBAction func buttonState(_ sender: Any)   { randState(); listState() }
    @IBAction func buttonSalary(_ sender: Any)  { randSalary(); listSalary() }
    @IBAction func buttonBool(_ sender: Any)    { randBool(); listBool() }
    @IBAction func buttonAll(_ sender: Any)     { randAll() }
    
    func randString()  { textString.stringValue = Random.string(10, caps: (checkCaps.state == 1)) }
    func randInteger() { textInteger.integerValue = Random.int(100) }
    func randDouble()  { textDouble.doubleValue = Random.double(100.00) }
    func randDate()    { textDate.stringValue = Random.date(from: 1900).description }
    func randName()    { textName.stringValue = Random.name() }
    func randCity()    { textCity.stringValue = Random.city() }
    func randState()   { textState.stringValue = Random.state() }
    func randSalary()  { textSalary.doubleValue = Random.salary() }
    func randBool()    { textBool.stringValue = Random.bool().description }

    func listString()  { textList.string = RandomList(10).string(10, caps: (checkCaps.state == 1)).joined(separator: "\n") }
    func listInteger() { textList.string = RandomList(10).int(from: 0, to: 100).reduce("") { $0 + String(describing: $1) + "\n" } }
    func listDouble()  { textList.string = RandomList(10).double(from: 0, to: 100).reduce("") { $0 + String(describing: $1) + "\n" } }
    func listDate()    { textList.string = RandomList(10).date(from: 1900).reduce("") { $0 + String(describing: $1) + "\n" } }
    func listName()    { textList.string = RandomList(10).name().joined(separator: "\n") }
    func listCity()    { textList.string = RandomList(10).city().joined(separator: "\n") }
    func listState()   { textList.string = RandomList(10).state().joined(separator: "\n") }
    func listSalary()  { textList.string = RandomList(10).salary().reduce("") { $0 + String(describing: $1) + "\n" } }
    func listBool()    { textList.string = RandomList(10).bool().reduce("") { $0 + String(describing: $1) + "\n" } }
    
    
    func randAll() {
        randString()
        randInteger()
        randDouble()
        randDate()
        randName()
        randCity()
        randState()
        randSalary()
        randBool()
        listString()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randAll()
        //test()
    }

    func test() {
        let str1      = Random.string(10)
        let str2      = Random.string(10, caps: true)
        let num1      = Random.int(10)
        let num2      = Random.int(from: 1, to: 100)
        let num3      = Random.double(9.99)
        let num4      = Random.double(from: 0.0, to: 99.99)
        let num5      = Random.float(9.99)
        let num6      = Random.float(from: 0.0, to: 99.99)
        let day1      = Random.date()
        let day2      = Random.date(from: 1920)
        let day3      = Random.date(from: Date.epoch)
        let day4      = Random.date(from: Date.yearIni, to: Date.today)
        let ok1       = Random.bool()
        let ok2       = Random.bool(probability: 25) // 25% probability
        let name      = Random.name()
        let state     = Random.state(short: true)
        let city      = Random.city()
        let (city1, state1) = Random.cityState()
        let address   = Random.address()
        let phone1    = Random.phone()
        let phone2    = Random.phone(state: "FL")
        let phone3    = Random.phone(code: "305")
        let salary1   = Random.salary()
        let salary2   = Random.salary(from: 50000, to: 95000, dec: 2)
        let email     = Random.email()
        let listInt1  = RandomList(10).int(100)
        let listInt2  = RandomList(10).int(from: 0, to: 100)
        let listDbl1  = RandomList(10).double()
        let listDbl2  = RandomList(10).double(from: 0.0, to: 99.9999, dec: 4)
        let listFlt1  = RandomList(10).float()
        let listFlt2  = RandomList(10).float(from: 0.0, to: 99.9999, dec: 4)
        let listDay1  = RandomList(10).date()
        let listDay2  = RandomList(10).date(from: 1920)
        let listDay3  = RandomList(10).date(from: Date(1920,01,01))
        let listDay4  = RandomList(10).date(from: Date.epoch)
        let listDay5  = RandomList(10).date(from: Date.yearIni, to: Date.today)
        let listBool  = RandomList(10).bool()
        let listName  = RandomList(10).name()
        let listState = RandomList(10).state()
        let listCity  = RandomList(10).city()
        
        //Results
        print("str10", str1)
        print("caps10", str2)
        print("int10", num1)
        print("int99", num2)
        print("dbl10", num3)
        print("dbl99", num4)
        print("flt10", num5)
        print("flt99", num6)
        print("dayYear", day1)
        print("day1920", day2)
        print("dayEpoch", day3)
        print("dayAll", day4)
        print("ok1", ok1)
        print("ok25", ok2)
        print("name", name)
        print("state", state)
        print("city", city)
        print("city1, state1", city1, state1)
        print("address", address)
        print("phone", phone1)
        print("phoneFL", phone2)
        print("phone305", phone3)
        print("salary1", salary1)
        print("salary2", salary2)
        print("email", email)
        print("listInt1", listInt1)
        print("listInt2", listInt2)
        print("listDbl1", listDbl1)
        print("listDbl2", listDbl2)
        print("listFlt1", listFlt1)
        print("listFlt2", listFlt2)
        print("listDay1", listDay1)
        print("listDay2", listDay2)
        print("listDay3", listDay3)
        print("listDay4", listDay4)
        print("listDay5", listDay5)
        print("listBool", listBool)
        print("listName", listName)
        print("listState", listState)
        print("listCity", listCity)

    }
}

