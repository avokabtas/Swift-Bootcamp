//
//  main.swift
//  quest1
//
//  Created by Aliia Satbakova  on 20.12.2023.
//

import Foundation

class Revolver<T: Equatable>: Equatable {
    var clip = [T?](repeating: nil, count: 6)
    var pointer: Int = 0

    func add(element: T) -> Bool {
        guard let index = clip.firstIndex(where: { $0 == nil }) else { return false }

        clip[index] = element
        return true
    }
    
    func add(list: [T]) -> Bool {
        for element in list {
            if !add(element: element) {
                return false
            }
        }
        return true
    }

    func shoot() -> T? {
        let currentPointer = pointer
        // Сдвигаем указатель на одну позицию вправо
        pointer = (pointer + 1) % clip.count
        
        // Если элемента нет в текущей позиции, возвращаем nil
        guard let shotElement = clip[currentPointer] else {
            return nil
        }
        // Удаляем элемент из текущей позиции
        clip[currentPointer] = nil
        // Возвращаем удаленный элемент
        return shotElement
    }
    
    func unloadAll() -> [T] {
        let unloadedItems = clip.compactMap { $0 }
        clip = [T?](repeating: nil, count: 6)
        pointer = 0
        return unloadedItems
    }
    
    func unload(index: Int) -> T? {
        guard index < clip.count else { return nil }
        
        let unloadedItem = clip[index]
        clip[index] = nil
        return unloadedItem
    }
    
    func scroll() {
        pointer = Int.random(in: 0..<clip.count)
        let temp = clip.remove(at: pointer)
        clip.insert(temp, at: 0)
    }
    
    func getSize() -> Int {
        return clip.compactMap { $0 }.count
    }
    
    static func == (lhs: Revolver<T>, rhs: Revolver<T>) -> Bool {
        guard lhs.clip.count == rhs.clip.count else { return false }
        
        for i in 0..<lhs.clip.count {
            if lhs.clip[i] != rhs.clip[i] {
                // Если элементы на соответствующих позициях не равны,
                // ищем элемент lhs.clip[i] в массиве rhs.clip
                if !rhs.clip.contains(lhs.clip[i]) {
                    return false
                }
            }
        }
        
        return true
    }

    subscript(index: Int) -> T? {
        guard index < clip.count else { fatalError("Error, index out of range.") }
        return clip[index]
    }
}

extension Revolver {
    func toStringDescription() -> String {
        var description = "Structure: RevolverMoonClip<\(T.self)>\nObjects: ["
        let objects = clip.enumerated().map { index, element in
            if let unwrappedElement = element {
                return "\(unwrappedElement)"
            } else {
                return "nil"
            }
        }
        description += objects.joined(separator: ", ")
        
        let pointerValue = (0..<clip.count).contains(pointer) && clip[pointer] != nil ? "\(clip[pointer]!)" : "nil"
        description += "]\nPointer: \(pointerValue)"
        
        return description
    }
}

/* ____________ Пример ____________ */

func main() {
    // ---------------- 1. Создание объекта револьвера и добавление элементов
    var revolver = Revolver<Int>()
    revolver.add(list: [3, 54, 7, 2, 56, 4])
    
    // Вывод описания револьвера
    print("1. Adding elements")
    print(revolver.toStringDescription())
    
    // ---------------- 2. Получение первого и последнего элемента с использованием subscript
    print("\n2. Subscript")
    print("\(revolver[0] ?? 0), \(revolver[5] ?? 0)")
    
    // ---------------- 3. Прокрутка револьвера и вывод описания
    print("\n3. Scroll")
    revolver.scroll()
    print(revolver.toStringDescription())
    
    // ---------------- 4. Удаление элементов и вывод описания
    print("\n4. Deletion")
    for _ in 0..<4 {
        revolver.shoot()
    }
    print(revolver.toStringDescription())
    
    // ---------------- 5. Создание и добавление новой коллекции элементов
    let supplyCollection = [4, 6, 3, 22, 77, 43, 76, 5]
    print("\n5. Supply collection")
    print("Before: ")
    print("Supply collection: \(supplyCollection)\n")
    
    print("\(revolver.toStringDescription())\n")
    
    print("After add operation performed:")
    revolver.add(list: supplyCollection)
    print(revolver.toStringDescription())
    
    // ---------------- 6. Извлечение всех элементов
    print("\n6. Extraction")
    let extractedList = revolver.unloadAll()
    print("The extracted list: \(extractedList)")
    print("size: \(extractedList.count)\n")
    print(revolver.toStringDescription())
    print("size: \(revolver.getSize())")
    
    // ---------------- 7. Добавление еще элементов и создание нового объекта сравнения
    print("\n7. Supply collection 2")
    let supplyCollection2 = [77, 43, 76, 5]
    print("Before:")
    print("Supply collection: \(supplyCollection2)\n")
    
    print("\(revolver.toStringDescription())\n")
    
    print("After add operation performed:")
    revolver.add(list: supplyCollection2)
    print(revolver.toStringDescription())
    
    // ---------------- 8. Оператор сравнения
    let newRevolver = Revolver<Int>()
    newRevolver.add(list: [5, 76, 43, 77])
    newRevolver.scroll()
    
    print("\n8. Equals")
    print("\(revolver.toStringDescription())\n")
    print("\(newRevolver.toStringDescription())\n")
    
    print(revolver == newRevolver ? "Result: equals" : "Result: not equals")
    
    let newRevolver2 = Revolver<Int>()
    newRevolver2.add(list: [1, 1, 1, 1])
    newRevolver2.scroll()
    
    print("\nПример, когда false:")
    print("\(revolver.toStringDescription())\n")
    print("\(newRevolver2.toStringDescription())\n")
    
    print(revolver == newRevolver2 ? "Result: equals" : "Result: not equals")
}

main()
