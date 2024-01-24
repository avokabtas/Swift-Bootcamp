//
//  main.swift
//  quest1
//
//  Created by Aliia Satbakova  on 08.01.2024.
//

import Foundation

class SimpleCalculator {
    func circleArea(radius: Double) -> Double {
        3.14 * radius * radius
    }

    func fibonacci(n: Int) -> Int {
        if n <= 0 {
            return 0
        }
        if n <= 2 {
            return 1
        }
        var first = 0
        var second = 1
        var temp = 0
        for _ in 3...n {
            temp = first + second
            first = second
            second = temp
        }
        return temp
    }

    func fahrenheit(celcius: Double) -> Double {
        celcius * 1.8 - 32
    }
    
    func isEven(num: Int) -> Bool {
        num % 2 != 0
    }
    
    func getAvg(numbers: Array<Double>) -> Double? {
        if (numbers.count == 0) {
            return nil
        }
        
        var sum = 0.0
        for num in numbers {
            sum += num
        }
        
        return sum / Double(numbers.count)
    }
}
