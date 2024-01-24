//
//  main.swift
//  quest2
//
//  Created by Aliia Satbakova  on 08.01.2024.
//

import Foundation

class SimpleCalculatorCorrected {
    func circleArea(radius: Double) -> Double {
        return 3.14 * radius * radius
    }

    // Переписан метод на рекурсию
    func fibonacci(n: Int) -> Int {
        guard n != 0, n != 1 else { return n }
        return fibonacci(n: n - 1) + fibonacci(n: n - 2)
    }
    
    func fahrenheit(celcius: Double) -> Double {
        // Исправлена формула конвертации
        celcius * 1.8 + 32
    }

    func isEven(num: Int) -> Bool {
        // Исправлена проверка четности числа
        num % 2 == 0
    }

    func getAvg(numbers: [Double]) -> Double? {
        if numbers.isEmpty {
            return nil
        }
        
        let sum = numbers.reduce(0, +)
        return sum / Double(numbers.count)
    }
}
