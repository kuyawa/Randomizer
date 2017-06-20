# Randomizer

A Swift library to generate random elements like string, int, double, float, date, bool, name, city, state, salary. Pending elements address, phone and email.

Use:

``` swift
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
let city      = Random.city()
let state     = Random.state(short: true)
let (city1, state1) = Random.cityState()
let address   = Random.address()
let phone1    = Random.phone()
let phone2    = Random.phone(state: "FL")
let phone3    = Random.phone(code: "305")
let salary1   = Random.salary()
let salary2   = Random.salary(from: 50000, to: 95000, dec: 2)
let email     = Random.email()
let color     = Random.color()

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
let listCity  = RandomList(10).city()
let listState = RandomList(10).state()
let listColor = RandomList(10).color()
```

Enjoy!
