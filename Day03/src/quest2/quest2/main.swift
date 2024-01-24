//
//  main.swift
//  quest2
//
//  Created by Aliia Satbakova  on 20.12.2023.
//

import Foundation

// MARK: - PatronStatus

enum PatronStatus {
    case charged, damp
}

// MARK: - Patron

class Patron {
    let id: Int
    let caliber: Int
    var status: PatronStatus
    var isPatronInserted: Bool = false
    
    static var uniqueID = 0
    
    init(caliber: Int, status: PatronStatus) {
        Patron.uniqueID += 1
        self.id = Patron.uniqueID
        self.caliber = caliber
        self.status = status
    }
    
    func shoot() {
        if status == .charged {
            print("Bang \(caliber)")
        } else {
            print("Click")
        }
        status = .damp
    }
}

// MARK: - Revolver

class Revolver {
    var clip = [Patron?](repeating: nil, count: 6)
    var pointer: Int = 0
    var caliber: Int
    
    init(caliber: Int) {
        self.caliber = caliber
    }
    
    var clamp: [Patron?] {
        get {
            return clip
        }
        set {
            if newValue.count <= 6 {
                clip = newValue + Array(repeating: nil, count: 6 - newValue.count)
            }
        }
    }
    
    func add(patron: Patron) -> Bool {
        guard patron.caliber == caliber, !patron.isPatronInserted else {
            return false
        }
        
        for index in 0 ..< clamp.count {
            if clamp[index] == nil {
                clamp[index] = patron
                patron.isPatronInserted = true
                return true
            }
        }
        return false
    }
    
    func add(patrons: [Patron]) -> Bool {
        var isInsertionSuccessful = true
        
        for patron in patrons {
            // Проверяем, что патрон еще не был добавлен в этот револьвер
            guard !patron.isPatronInserted else {
                continue
            }
            
            // Проверяем, есть ли патрон с таким же id в револьвере
            let isDuplicate = clip.contains { $0?.id == patron.id }
            if isDuplicate {
                continue
            }
            
            // Добавляем патрон в первое пустое место в револьвере
            if let index = clip.firstIndex(where: { $0 == nil }) {
                clip[index] = patron
                patron.isPatronInserted = true
            } else {
                // Если нет свободных мест, то не удалось добавить патрон
                isInsertionSuccessful = false
                break
            }
        }
        
        // Если не удалось добавить всех патронов, удаляем уже добавленные патроны
        if !isInsertionSuccessful {
            for patron in patrons {
                if patron.isPatronInserted {
                    if let indexToRemove = clip.firstIndex(where: { $0?.id == patron.id }) {
                        clip[indexToRemove] = nil
                    }
                    patron.isPatronInserted = false
                }
            }
        }
        
        return isInsertionSuccessful
    }
    
    func shoot() {
        if let patron = clip[pointer] {
            patron.shoot()
            if patron.status == .damp {
                clip[pointer] = nil
            }
        } else {
            print("Click")
        }
        pointer = (pointer + 1) % clip.count
    }
    
    subscript(index: Int) -> Patron? {
        guard index < clip.count else { fatalError("Error, index out of range.") }
        return clip[index]
    }
}

// MARK: - Revolver Description

extension Revolver {
    func toStringDescription() -> String {
        var description = "Structure: RevolverMoonClip \(caliber) caliber\nObjects: ["
        for index in 0..<clip.count {
            if let patron = clip[index] {
                description += "Patron(id\(patron.id), \(patron.status), \(patron.caliber))"
            } else {
                description += "nil"
            }
            
            if index != clip.count - 1 {
                description += ", "
            }
        }
        description += "]\n"
        let filteredClip = clip.map { $0 != nil ? "Patron(id\($0!.id), \($0!.status), \($0!.caliber))" : "nil" }
        let pointerValue = filteredClip.indices.contains(pointer) ? filteredClip[pointer] : "nil"
        description += "Pointer: \(pointerValue)\n"
        return description
    }
    
    func arrayDescription() -> String {
        var description = "["
        for index in 0..<clip.count {
            if let patron = clip[index] {
                description += "Patron(id\(patron.id), \(patron.status), \(patron.caliber))"
            } else {
                description += "nil"
            }
            
            if index != clip.count - 1 {
                description += ", "
            }
        }
        description += "]"
        return description
    }
}


/* ____________ Пример ____________ */

// ---------------- 1.
func testShootOrDamp() {
    let revolver = Revolver(caliber: 32)
    let patron1 = Patron(caliber: 32, status: .charged)
    let patron2 = Patron(caliber: 32, status: .damp)
    
    revolver.add(patron: patron1)
    revolver.add(patron: patron2)
    
    print("1. Shoot or damp")
    print(revolver.toStringDescription())
    
    print("Shoot # call shoot()")
    revolver.shoot()
    print("\n\(revolver.toStringDescription())")
    
    print("Shoot")
    revolver.shoot()
    print(revolver.toStringDescription())
}

// ---------------- 2.
func testUniquePatron() {
    let revolver1 = Revolver(caliber: 45)
    let revolver2 = Revolver(caliber: 45)
    let patron = Patron(caliber: 45, status: .charged)
    
    print("2. Unique Patron")
    print(patron)
    
    print("Revolver1: \(revolver1.clip)")
    print("Revolver2: \(revolver2.clip)")
    
    print("\nAdd1 # call add()")
    revolver1.add(patron: patron)
    print("Revolver1: \(revolver1.arrayDescription())")
    print("Revolver2: \(revolver2.arrayDescription())")
    
    print("\nAdd2")
    revolver2.add(patron: patron)
    print("Revolver1: \(revolver1.arrayDescription())")
    print("Revolver2: \(revolver2.arrayDescription())")
}

// ---------------- 3.
func testUniquePatronInCollection() {
    print("\n3. Unique Patron in collection")
    
    let revolver1 = Revolver(caliber: 32)
    let revolver2 = Revolver(caliber: 32)
    
    let patron1 = Patron(caliber: 32, status: .charged)
    let patron2 = Patron(caliber: 32, status: .charged)
    let patron3 = Patron(caliber: 32, status: .charged)
    let patron4 = Patron(caliber: 32, status: .charged)
    let patron5 = Patron(caliber: 32, status: .charged)
    
    let patronsCollection1 = [patron1, patron2, patron3]
    let patronsCollection2 = [patron1, patron4, patron5]
    
    print("Revolver1: \(revolver1.arrayDescription())")
    print("Revolver2: \(revolver2.arrayDescription())")
    
    print("\nCollection1: \(patronsCollection1.map { "Patron(id\($0.id), \($0.status), \($0.caliber))" })")
    print("Collection2: \(patronsCollection2.map { "Patron(id\($0.id), \($0.status), \($0.caliber))" })")
    
    print("\nAdd1 # call add for 1 st collection")
    revolver1.add(patrons: patronsCollection1)
    print("Revolver1: \(revolver1.arrayDescription())")
    
    print("\nAdd2")
    revolver2.add(patrons: patronsCollection2)
    print("Revolver1: \(revolver1.arrayDescription())")
    print("Revolver2: \(revolver2.arrayDescription())")
}

testShootOrDamp()
testUniquePatron()
testUniquePatronInCollection()
