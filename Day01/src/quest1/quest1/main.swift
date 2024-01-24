//
//  main.swift
//  quest1
//
//  Created by Aliia Satbakova  on 13.12.2023.
//

import Foundation

// MARK: - Accident Type

enum AccidentType: String {
    case fire = "fire"
    case gasLeak = "gas leak"
    case catOnTheTree  = "cat on the tree"
}

// MARK: - Danger Level

enum DangerLevel: String {
    case low
    case medium
    case high
}

// MARK: - Accident

struct Accident {
    var coordinates: (Int, Int)
    var description: String
    var applicantNumber: Int?
    var type: AccidentType?
}

// MARK: - Zone

class Zone {
    var phoneNumber: Int
    var name: String
    var departmentServiceCode: Int
    var dangerLevel: DangerLevel
    
    init(phoneNumber: Int, name: String, departmentServiceCode: Int, dangerLevel: DangerLevel) {
        self.phoneNumber = phoneNumber
        self.name = name
        self.departmentServiceCode = departmentServiceCode
        self.dangerLevel = dangerLevel
    }
    
    func isAccidentInZone(accidentCoordinates: (Int, Int)) -> Bool {
        // Проверка наличия инцидента в зоне
        // Реализация зависит от конкретной формы зоны
        return false
    }
}

// MARK: - Circle Zone

class CircleZone: Zone {
    var center: (Int, Int)
    var radius: Int
    
    init(phoneNumber: Int, name: String, departmentServiceCode: Int, dangerLevel: DangerLevel, center: (Int, Int), radius: Int) {
        self.center = center
        self.radius = radius
        super.init(phoneNumber: phoneNumber, name: name, departmentServiceCode: departmentServiceCode, dangerLevel: dangerLevel)
    }
    
    override func isAccidentInZone(accidentCoordinates: (Int, Int)) -> Bool {
        let deltaX = accidentCoordinates.0 - center.0
        let deltaY = accidentCoordinates.1 - center.1
        let distance = sqrt(Double(deltaX * deltaX + deltaY * deltaY))
        return distance <= Double(radius)
    }
}

// MARK: - Triangle Zone

class TriangleZone: Zone {
    var pointA: (Int, Int)
    var pointB: (Int, Int)
    var pointC: (Int, Int)
    
    init(phoneNumber: Int, name: String, departmentServiceCode: Int, dangerLevel: DangerLevel, pointA: (Int, Int), pointB: (Int, Int), pointC: (Int, Int)) {
        self.pointA = pointA
        self.pointB = pointB
        self.pointC = pointC
        super.init(phoneNumber: phoneNumber, name: name, departmentServiceCode: departmentServiceCode, dangerLevel: dangerLevel)
    }
    
    override func isAccidentInZone(accidentCoordinates: (Int, Int)) -> Bool {
        let v1 = (pointB.0 - pointA.0, pointB.1 - pointA.1)
        let v2 = (pointC.0 - pointA.0, pointC.1 - pointA.1)
        let v3 = (accidentCoordinates.0 - pointA.0, accidentCoordinates.1 - pointA.1)
        
        let dot00 = v2.0 * v2.0 + v2.1 * v2.1
        let dot01 = v2.0 * v1.0 + v2.1 * v1.1
        let dot02 = v2.0 * v3.0 + v2.1 * v3.1
        let dot11 = v1.0 * v1.0 + v1.1 * v1.1
        let dot12 = v1.0 * v3.0 + v1.1 * v3.1
        
        let invDenom = 1 / (dot00 * dot11 - dot01 * dot01)
        let u = (dot11 * dot02 - dot01 * dot12) * invDenom
        let v = (dot00 * dot12 - dot01 * dot02) * invDenom
        
        return (u >= 0) && (v >= 0) && (u + v < 1)
    }
}

// MARK: - Quadrilateral Zone

class QuadrilateralZone: Zone {
    var pointA: (Int, Int)
    var pointB: (Int, Int)
    var pointC: (Int, Int)
    var pointD: (Int, Int)
    
    init(phoneNumber: Int, name: String, departmentServiceCode: Int, dangerLevel: DangerLevel, pointA: (Int, Int), pointB: (Int, Int), pointC: (Int, Int), pointD: (Int, Int)) {
        self.pointA = pointA
        self.pointB = pointB
        self.pointC = pointC
        self.pointD = pointD
        super.init(phoneNumber: phoneNumber, name: name, departmentServiceCode: departmentServiceCode, dangerLevel: dangerLevel)
    }
    
    override func isAccidentInZone(accidentCoordinates: (Int, Int)) -> Bool {
        let triangle1 = TriangleZone(phoneNumber: phoneNumber, name: name, departmentServiceCode: departmentServiceCode, dangerLevel: dangerLevel, pointA: pointA, pointB: pointC, pointC: pointB)
        let triangle2 = TriangleZone(phoneNumber: phoneNumber, name: name, departmentServiceCode: departmentServiceCode, dangerLevel: dangerLevel, pointA: pointA, pointB: pointD, pointC: pointC)
        
        return triangle1.isAccidentInZone(accidentCoordinates: accidentCoordinates) || triangle2.isAccidentInZone(accidentCoordinates: accidentCoordinates)
    }
}

// MARK: - Create Circle Zone

func createCircleZone(center: (Int, Int), radius: Int) -> CircleZone? {
    print("Enter phone number:")
    guard let phone = Int(readLine() ?? "") else {
        print("Invalid input for phone number.")
        return nil
    }
    
    print("Enter name:")
    guard let name = readLine() else {
        print("Invalid input for name.")
        return nil
    }
    
    print("Enter emergency dept:")
    guard let dept = Int(readLine() ?? "") else {
        print("Invalid input for emergency department.")
        return nil
    }
    
    print("Enter danger level (low, medium, high):")
    guard let dangerStr = readLine(), let danger = DangerLevel(rawValue: dangerStr.lowercased()) else {
        print("Invalid input for danger level.")
        return nil
    }
    
    return CircleZone(phoneNumber: phone, name: name, departmentServiceCode: dept, dangerLevel: danger, center: center, radius: radius)
}

// MARK: - Create Triangle Zone

func createTriangleZone(pointA: (Int, Int), pointB: (Int, Int), pointC: (Int, Int)) -> TriangleZone? {
    print("Enter phone number:")
    guard let phone = Int(readLine() ?? "") else {
        print("Invalid input for phone number.")
        return nil
    }
    
    print("Enter name:")
    guard let name = readLine() else {
        print("Invalid input for name.")
        return nil
    }
    
    print("Enter emergency dept:")
    guard let dept = Int(readLine() ?? "") else {
        print("Invalid input for emergency department.")
        return nil
    }
    
    print("Enter danger level (low, medium, high):")
    guard let dangerStr = readLine(), let danger = DangerLevel(rawValue: dangerStr.lowercased()) else {
        print("Invalid input for danger level.")
        return nil
    }
    
    return TriangleZone(phoneNumber: phone, name: name, departmentServiceCode: dept, dangerLevel: danger, pointA: pointA, pointB: pointB, pointC: pointC)
}

// MARK: - Create Quadrilateral Zone

func createQuadrilateralZone(pointA: (Int, Int), pointB: (Int, Int), pointC: (Int, Int), pointD: (Int, Int)) -> QuadrilateralZone? {
    print("Enter phone number:")
    guard let phone = Int(readLine() ?? "") else {
        print("Invalid input for phone number.")
        return nil
    }
    
    print("Enter name:")
    guard let name = readLine() else {
        print("Invalid input for name.")
        return nil
    }
    
    print("Enter emergency dept:")
    guard let dept = Int(readLine() ?? "") else {
        print("Invalid input for emergency department.")
        return nil
    }
    
    print("Enter danger level (low, medium, high):")
    guard let dangerStr = readLine(), let danger = DangerLevel(rawValue: dangerStr.lowercased()) else {
        print("Invalid input for danger level.")
        return nil
    }
    
    return QuadrilateralZone(phoneNumber: phone, name: name, departmentServiceCode: dept, dangerLevel: danger, pointA: pointA, pointB: pointB, pointC: pointC, pointD: pointD)
}

// MARK: - Start Service

func startService() {
    print("Enter zone parameters:")
    guard let zoneInput = readLine() else {
        print("Invalid input for zone parameters.")
        return
    }
    
    let zoneValues = zoneInput.components(separatedBy: " ").flatMap { $0.components(separatedBy: ";").compactMap { Int($0) } }
    
    let coordinatesCount = zoneValues.count / 2
    
    var coordinates: [(Int, Int)] = []
    
    for i in stride(from: 0, to: zoneValues.count, by: 2) {
        if i + 1 < zoneValues.count {
            coordinates.append((zoneValues[i], zoneValues[i + 1]))
        }
    }
    
    var zone: Zone?
    
    print("Enter the zone info:")
    print("Enter the shape of area (circle, triangle, or quadrangle):")
    guard let shape = readLine()?.lowercased() else {
        print("Invalid input for zone shape.")
        return
    }
    
    switch shape {
    case "circle":
        guard coordinatesCount >= 1 else {
            print("Invalid number of coordinates for a circle.")
            return
        }
        // Получаем координаты центра и радиус круга из ввода пользователя
        let center = coordinates[0]
        let radius = zoneValues.last ?? 0 // Последнее значение - это радиус круга
        zone = createCircleZone(center: center, radius: radius)
    case "triangle":
        guard coordinates.count >= 3 else {
            print("Invalid number of coordinates for a triangle.")
            return
        }
        let pointA = coordinates[0]
        let pointB = coordinates[1]
        let pointC = coordinates[2]
        zone = createTriangleZone(pointA: pointA, pointB: pointB, pointC: pointC)
    case "quadrangle":
        guard coordinates.count >= 4 else {
            print("Invalid number of coordinates for a quadrangle.")
            return
        }
        let pointA = coordinates[0]
        let pointB = coordinates[1]
        let pointC = coordinates[2]
        let pointD = coordinates[3]
        zone = createQuadrilateralZone(pointA: pointA, pointB: pointB, pointC: pointC, pointD: pointD)
    default:
        print("Invalid shape of area.")
        return
    }
    
    guard let zone = zone else {
        print("Error creating zone.")
        return
    }
    
    print("Enter an accident coordinates:")
    guard let incidentInput = readLine() else {
        print("Invalid input for accident coordinates.")
        return
    }
    
    let incidentCoords = incidentInput.components(separatedBy: ";").compactMap { Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) }
    guard incidentCoords.count == 2 else {
        print("Invalid input for accident coordinates.")
        return
    }
    
    print("Enter the accident info:")
    print("Enter description:")
    guard let description = readLine() else {
        print("Invalid input for accident description.")
        return
    }
    
    print("Enter phone number:")
    guard let applicantNumber = Int(readLine() ?? "") else {
        print("Invalid input for applicant phone number.")
        return
    }
    
    print("Enter type:")
    guard let accidentType = readLine()?.lowercased(), let type = AccidentType(rawValue: accidentType) else {
        print("Invalid input for accident type.")
        return
    }
    
    let accident = Accident(coordinates: (incidentCoords[0], incidentCoords[1]), description: description, applicantNumber: applicantNumber, type: type)
    
    if zone.isAccidentInZone(accidentCoordinates: accident.coordinates) {
        print("An accident is in \(zone.name)")
        print("Zone Information:")
        print("Phone Number: \(zone.phoneNumber)")
        print("Name: \(zone.name)")
        print("Emergency Department Code: \(zone.departmentServiceCode)")
        print("Danger Level: \(zone.dangerLevel)")
        print("Accident Information:")
        print("Description: \(accident.description)")
        print("Applicant Phone Number: \(accident.applicantNumber ?? 0)")
        print("Accident Type: \(accident.type?.rawValue ?? "")")
    } else {
        print("An accident is not in \(zone.name)")
        print("Switch the applicant to the common number: 88008473824")
    }
}

//------------------------ Manual ------------------------

// startService()

/*
 ----------- Example -----------
 
 ----------- Input data:
 Enter zone parameters:
 3;4 2

 Enter the zone info:
 Enter the shape of area:
 circle
 Enter phone number:
 89347362826
 Enter name: Sovetsky
 district
 Enter emergency dept:
 49324
 Enter danger level:
 low

 Enter an accident coordinates:
 9;9

 Enter the accident info:
 Enter description:
 the woman said her cat can't get off the tree
 Enter phone number:
 +74832648573
 Enter type:
 cat on the tree
 
 ----------- Output data:
 An accident is not in Sovetsky district
 Switch the applicant to the common number: 88008473824
 */


//------------------------ Auto ------------------------
func auto() {
    // Создание зоны круга
    let circleZone = CircleZone(phoneNumber: 89347362826, name: "Sovetsky district", departmentServiceCode: 49324, dangerLevel: .medium, center: (5, 5), radius: 4)
    
    // Создание инцидента внутри зоны круга
    let accidentInsideZone = Accident(coordinates: (6, 6), description: "Accident inside the zone - Cat help!", applicantNumber: 82221112200, type: .catOnTheTree)
    
    // Создание инцидента вне зоны круга
    let accidentOutsideZone = Accident(coordinates: (10, 10), description: "Accident outside the zone - Gas leak!", applicantNumber: 123456789, type: .gasLeak)
    
    // Проверка инцидента внутри зоны круга
    print("----- Внутри зоны -----")
    if circleZone.isAccidentInZone(accidentCoordinates: accidentInsideZone.coordinates) {
        print("An accident is in \(circleZone.name)")
        print("Zone Information:")
        print("Phone Number: \(circleZone.phoneNumber)")
        print("Name: \(circleZone.name)")
        print("Emergency Department Code: \(circleZone.departmentServiceCode)")
        print("Danger Level: \(circleZone.dangerLevel)")
        print("Accident Information:")
        print("Description: \(accidentInsideZone.description)")
        print("Applicant Phone Number: \(accidentInsideZone.applicantNumber ?? 0)")
        print("Accident Type: \(accidentInsideZone.type?.rawValue ?? "")")
    } else {
        print("An accident is not in \(circleZone.name)")
        print("Switch the applicant to the common number: 88008473824")
    }
    
    // Проверка инцидента вне зоны круга
    print("----- Вне зоны -----")
    if circleZone.isAccidentInZone(accidentCoordinates: accidentOutsideZone.coordinates) {
        print("An accident is in \(circleZone.name)")
        print("Zone Information:")
        print("Phone Number: \(circleZone.phoneNumber)")
        print("Name: \(circleZone.name)")
        print("Emergency Department Code: \(circleZone.departmentServiceCode)")
        print("Danger Level: \(circleZone.dangerLevel)")
        print("Accident Information:")
        print("Description: \(accidentOutsideZone.description)")
        print("Applicant Phone Number: \(accidentOutsideZone.applicantNumber ?? 0)")
        print("Accident Type: \(accidentOutsideZone.type?.rawValue ?? "")")
    } else {
        print("An accident is not in \(circleZone.name)")
        print("Switch the applicant to the common number: 88008473824")
    }
}

auto()
