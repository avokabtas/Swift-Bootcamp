//
//  main.swift
//  quest2
//
//  Created by Aliia Satbakova  on 04.12.2023.
//

import Foundation

enum Direction: String {
    case lower
    case higher
}

enum NumberAnalyzerError: Error {
    case invalidInput
}

func generateNumbers(_ direction: Direction, _ number: Int) throws {
    // Проверяем введенное число на нулевое значение -> выбрасываем ошибку
    if number == 0 {
        throw NumberAnalyzerError.invalidInput
    }
    
    var numberToIntArray: [Int] = []
    // Массив цифр в обратном порядке
    var reversedStringNumber = String(number).reversed().compactMap { Int(String($0)) }
    
    // Определение порядка, в котором должны быть сгенерированы числа на основе значения
    if direction.rawValue == Direction.lower.rawValue {
        reversedStringNumber = String(number).compactMap { Int(String($0)) }
    } else if direction.rawValue == Direction.higher.rawValue {
        reversedStringNumber = String(number).reversed().compactMap { Int(String($0)) }
    } else {
        // Если введено неправильное направление, выбрасываем ошибку
        throw NumberAnalyzerError.invalidInput
    }
    
    // Создаем числа из комбинаций цифр, начиная с первой или последней в зависимости от направления
    for _ in 0..<reversedStringNumber.count {
        // В каждой итерации получаем новую последовательность чисел, увеличивающихся на +1
        let subNumber = reversedStringNumber
            .prefix(reversedStringNumber.index(reversedStringNumber.startIndex, offsetBy: numberToIntArray.count + 1))
        // Конвертируем подстроку subNumber в строку и затем в целое число
        if let subNumberInt = Int(subNumber.reduce("") { $0 + String($1) }) {
            // Если все ок - добавляем в массив
            numberToIntArray.append(subNumberInt)
        }
    }
    
    // Если введено отрицательное число - преобразуем каждый элемент массива
    if number < 0 {
        numberToIntArray = numberToIntArray.map { -$0 }
    }
    
    // Выводим числа
    numberToIntArray.forEach { print($0) }
}

func processInput() {
    print("Enter 'lower' or 'higher':")
    guard let directionInput = readLine()?.lowercased(), let direction = Direction(rawValue: directionInput) else {
        print("Invalid input for direction. Please enter 'lower' or 'higher'.")
        return
    }
    
    print("Enter a number:")
    guard let number = Int(readLine() ?? "") else {
        print("Invalid input. Please enter a number.")
        return
    }
    
    do {
        try generateNumbers(direction, number)
    } catch {
        print("Error: \(error.localizedDescription)")
    }
}

processInput()


//do {
//    try generateNumbers(.lower, 352)  // должно быть: 3  35  352
//    try generateNumbers(.higher, -352) // должно быть: -2  -25  -253
//    try generateNumbers(.higher, 1000) // должно быть: 0  0  0  1
//} catch {
//    print("Error: \(error)")
//}


/*
 Input data: lower 352
 Output data: 3  35  352

 Input data: higher -352
 Output data: -2  -25  -253

 Input data: higher 1000
 Output data: 0  0  0  1
 */
