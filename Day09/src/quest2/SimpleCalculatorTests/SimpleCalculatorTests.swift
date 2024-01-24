//
//  SimpleCalculatorTests.swift
//  SimpleCalculatorTests
//
//  Created by Aliia Satbakova  on 08.01.2024.
//

import XCTest
@testable import quest2

final class SimpleCalculatorTests: XCTestCase {
    
    var calculator: SimpleCalculatorCorrected!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        calculator = SimpleCalculatorCorrected()
    }
    
    override func tearDownWithError() throws {
        calculator = nil
        try super.tearDownWithError()
    }
    
    // Тест circleArea(radius: Double) -> Double
    func testCircleArea() {
        let radius: Double = 5.0
        XCTAssertEqual(calculator.circleArea(radius: radius), 78.5, accuracy: 0.001)
    }
    
    // Тест fibonacci(n: Int) -> Int
    func testFibonacci() {
        XCTAssertEqual(calculator.fibonacci(n: 0), 0)
        XCTAssertEqual(calculator.fibonacci(n: 1), 1)
        XCTAssertEqual(calculator.fibonacci(n: 2), 1)
        XCTAssertEqual(calculator.fibonacci(n: 3), 2)
        XCTAssertEqual(calculator.fibonacci(n: 4), 3)
        XCTAssertEqual(calculator.fibonacci(n: 5), 5)
        XCTAssertEqual(calculator.fibonacci(n: 6), 8)
        XCTAssertEqual(calculator.fibonacci(n: 7), 13)
        XCTAssertEqual(calculator.fibonacci(n: 8), 21)
        XCTAssertEqual(calculator.fibonacci(n: 9), 34)
    }
    
    // Тест fahrenheit(celcius: Double) -> Double
    func testFahrenheit() {
        XCTAssertEqual(calculator.fahrenheit(celcius: 0), 32, accuracy: 0.001)
        XCTAssertEqual(calculator.fahrenheit(celcius: 100), 212, accuracy: 0.001)
    }
    
    // Тест isEven(num: Int) -> Bool
    func testIsEven() {
        XCTAssertTrue(calculator.isEven(num: 2))
        XCTAssertTrue(calculator.isEven(num: 0))
        XCTAssertFalse(calculator.isEven(num: 1))
        XCTAssertFalse(calculator.isEven(num: -1))
    }
    
    // Тест getAvg(numbers: Array<Double>) -> Double?
    func testGetAvg() {
        XCTAssertNil(calculator.getAvg(numbers: []))
        XCTAssertNotNil(calculator.getAvg(numbers: [1.0, 2.0, 3.0]))
        XCTAssertEqual(calculator.getAvg(numbers: [1.0, 2.0, 3.0])!, 2.0, accuracy: 0.001)
    }
    
}
