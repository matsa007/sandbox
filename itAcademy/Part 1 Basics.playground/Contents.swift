import Foundation
import Darwin

// Глава 2 задание 1

var lenthKm:Double = 300
var timeSec:Int = 3000
var velocityMetrMin:Double = lenthKm * 1000 / Double(timeSec)
print("Your velocity in M/S is: \(velocityMetrMin) m/s was given on \(lenthKm) Kilometers by \(timeSec) seconds.")
print(Int(velocityMetrMin))
print(Int(lenthKm))
print(lenthKm)
print(timeSec)

// Глава 2 задание 2

var chislo1 = 123
var chsilo2 = 456
var dvachisla = "\(chislo1)\(chsilo2)"
print(dvachisla)

// Глава 2 задание 3

var a1:Int8 = Int8.min
var a2:UInt8 = UInt8.max

print(a1,a2)
print(a1)
print(a2)

// Листинг 1.3

var str = "Hello, playground"
print(str)

var age = Int(-33) + Int(lenthKm)

let name = String("Sergey")

print(name,"- it's my First Name",str)

var by = Int(1)
var bb = String(by + by)

// Глава 2 задание 4

var aa1 = 1
var aa2:Int = 2
print(aa1,aa2)
print("Value 1 = \(aa1) and Value 2 = \(aa2)")

var aa = aa1
aa1 = aa2
aa2 = aa
print(aa1,aa2)
print("Value 1 = \(aa1) and Value 2 = \(aa2)")

// Глава 2 задание 5

let constanta1:Float = 3.14
var perem1 = Double(4.55)
perem1 = 2.44

// Глава 2 задание 6

let cnst1 = 18
let cnst2 = Float(16.4)
let cnst3 = 5.7
let summCnst = Float(cnst1) + cnst2 + Float(cnst3)
var multipliedCnsts = Int(Double(cnst1) * Double(cnst2) * cnst3)
var ostatok = Double(cnst2.truncatingRemainder(dividingBy: Float(cnst3)))

print(summCnst)
print((multipliedCnsts))
print(ostatok)

// Глава 2 задание 7

var aaa1 = 1.75
var bbb1 = 3.25
var ccc1 = ((aaa1 + 4*bbb1)*(aaa1 - 3*bbb1)) + pow(aaa1,2)

// Глава 2 задание 8

var c = 1.75
var d = 3.25
var e = 2*(c + 1)*2 + 3*(d + 1)

print(e)
print(type(of: e))

// Глава 2 задание 9

let lenth1 = 11
let sqS = pow(Double(lenth1),2)
let okrL = Double(2*3.14*Double(lenth1))

// Глава 2 задание 11

print("*  *  *")
print(" ** **")
print("  * *")

// Глава 2 задание 10

var pperem1 = "Sergo"
let constatnt1 = Character ("$")
var pperem2 = 55
var pperem3 = 22
var obsch = String("\(pperem1)\(constatnt1)\(pperem2 + pperem3)")
print(obsch)
print(pperem1 + String(constatnt1) + String(pperem2 + pperem3))

// Глава 2 задание 12

var den = 22
var mesjac = "Februar"
var god = 1988
print("\(god) \(mesjac) \(den)")
print(god,mesjac,den)
print(String(god) + mesjac + String(den))
print(String(god) + " " + mesjac + " " + String(den))

// Глава 2 задание 13

var peremen1 = true
var peremen2 = false

if peremen1 == true {
    print("Siski")
} else {
    print("Piski")
}
print(type(of: peremen1))

// Листинг 1.9

let friend1 = "John", friend2 = "Helga"
var age1 = 54, age2 = 25
let age3 = age1
print(age3)
age3

// Глава 2 задание 15

let myName1 = "Siarhei"
var myWeightKg:Float = 73
var myHeightSm = Int(183)
var heightM = Float(myHeightSm)/100
var imt = Double(myWeightKg)/pow(Double(heightM), 2)

print("Hello, my name is \(myName1) and my IMT is: \(imt)")
print("Hello, my name is",String(myName1),"and my IMT is:",String(imt))
print("Hello, my name is",String(myName1),"and my IMT is:",String(Int(imt)))
print("Hello, my name is",String(myName1),"and my IMT is:",String(Int(imt)), separator: " ")
print("Hello, my name is",String(myName1),"and my IMT is:",String(Int(imt)), terminator: ".")
print("Hello, my name is",String(myName1),"and my IMT is:",String(Int(imt)), separator: "*", terminator: ".")

//Глава 2 задание 18

let aaaa1:Double = 14.5
let bbbb2 = Double(18.7)
let average = Float(aaaa1 + bbbb2)/2

var number111 = 18
// несколько выражений в строке — точка с запятой нужна
number111 = 55; let userName1111 = "Alex"
print(number111,userName1111)

enum Transport {
    case car (weight: Int, lenth: Int)
    case boat (lenth: Int, maxSpeed: Int, heiGHT: Int)
    case plane
}


var yacht = Transport.boat(lenth: 3, maxSpeed: 5, heiGHT: 76)

print("dsada\(yacht)")

struct Yuy { var tata: Int = -1 }
var aaaaa = Yuy()
var bbbbb = aaaaa
aaaaa.tata = 42
print("\(aaaaa.tata), \(bbbbb.tata)")
print(aaaaa)

class Ccccc {
    var rata: Int = -1
}
var ddddd = Ccccc()
var eeeee = ddddd
ddddd.rata = 42
print("\(ddddd.rata), \(eeeee.rata)")


var dict1 = Dictionary<String, String>()
var dict2 = [Int: String]()

var dict3: Dictionary<Int, String> = [:]
var dict4: [Int: String] = [:]

var dict5 = Dictionary <String, String>(dictionaryLiteral: ("key", "some string"), ("another key", "another string"))
var dict6: [Int: String] = [1: "Book", 2: "Book 2"]
var dict7 = [1:1, 2:2, 3:3]
type(of: dict7)

var dict = Dictionary<Int, String>()
dict.count
dict.capacity
dict.isEmpty

dict[1]
dict[1] = "One"
dict[1]
dict[3] = "Three"
dict.count
dict.isEmpty

dict[2] = "Two"
dict.updateValue("Three", forKey: 4)
print(dict)
dict.updateValue("Nono", forKey: 4)
print(dict)
dict[4]
dict[4] = "YYY"

//dict[1] = nil
dict[1]
// dict.removeAll()
//var group = dict.removeValue(forKey: 2)
//print(group)
//var dict8 = dict.popFirst()
//dict8

dict.randomElement()
dict.contains {key, value in
    return key == 1 && value == "One"
}

for (key, value) in dict {
print ("in key: \(key), lay value: \(value)")
}

for value in dict.values {
    print(value)
}
