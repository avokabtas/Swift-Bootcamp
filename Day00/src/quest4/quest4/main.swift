//
//  main.swift
//  quest4
//
//  Created by Aliia Satbakova  on 04.12.2023.
//

import Foundation

enum Season {
    case summer
    case winter
}

enum TemperatureScale: String {
    case Celsius
    case Kelvin
    case Fahrenheit
}

enum HumiditySeason {
    case summer
    case winter
}

// Конвертируем температуру из одной шкалы измерения в другую
func convertToScale(temperature: Double, from scale: TemperatureScale, to targetScale: TemperatureScale) -> Double {
    switch (scale, targetScale) {
    case (.Celsius, .Kelvin):
        return temperature + 273.15
    case (.Celsius, .Fahrenheit):
        return (temperature * 9 / 5) + 32
    case (.Kelvin, .Celsius):
        return temperature - 273.15
    case (.Kelvin, .Fahrenheit):
        return (temperature * 9 / 5) - 459.67
    case (.Fahrenheit, .Celsius):
        return (temperature - 32) * 5 / 9
    case (.Fahrenheit, .Kelvin):
        return (temperature + 459.67) * 5 / 9
    default:
        return temperature
    }
}

// Печатаем температуру в зависимости от выбранной шкалы
func printTemperature(temperature: Double, scale: TemperatureScale) {
    switch scale {
    case .Celsius:
        print("The temperature is \(temperature) ˚C")
    case .Kelvin:
        print("The temperature is \(temperature) K")
    case .Fahrenheit:
        print("The temperature is \(temperature) F")
    }
}

// Возвращаем комфортные диапазоны температуры в зависимости от сезона
func getComfortableTemperatureLimits(season: Season) -> (lowerLimit: Double, upperLimit: Double) {
    switch season {
    case .summer:
        return (22, 25)
    case .winter:
        return (20, 22)
    }
}

// Возвращаем комфортные диапазоны влажности в зависимости от сезона
func getComfortableHumidityRange(season: HumiditySeason) -> (lowerLimit: Int, upperLimit: Int) {
    switch season {
    case .summer:
        return (30, 60)
    case .winter:
        return (30, 45)
    }
}

// Печатаем комфортный диапазон температур, учитывая выбранный сезон и шкалу измерения
func printComfortableTemperatureRange(season: Season, inScale scale: TemperatureScale) {
    var limits = getComfortableTemperatureLimits(season: season)
    var result: String

    switch scale {
    case .Celsius:
        result = "˚C"
    case .Kelvin:
        limits.lowerLimit = convertToScale(temperature: limits.lowerLimit, from: .Celsius, to: .Kelvin)
        limits.upperLimit = convertToScale(temperature: limits.upperLimit, from: .Celsius, to: .Kelvin)
        result = "K"
    case .Fahrenheit:
        limits.lowerLimit = convertToScale(temperature: limits.lowerLimit, from: .Celsius, to: .Fahrenheit)
        limits.upperLimit = convertToScale(temperature: limits.upperLimit, from: .Celsius, to: .Fahrenheit)
        result = "F"
    }

    print("The comfortable temperature is from \(limits.lowerLimit) to \(limits.upperLimit) \(result).")
}

// Печатаем комфортный диапазон влажности, учитывая выбранный сезон
func printComfortableHumidityRange(season: HumiditySeason) {
    let limits = getComfortableHumidityRange(season: season)
    print("The comfortable humidity is from \(limits.lowerLimit)% to \(limits.upperLimit)%")
}

//  Проверяем, находится ли текущая температура в пределах комфортного диапазона для выбранного сезона и шкалы измерения
func checkComfortableTemperature(temperature: Double, season: Season, inScale scale: TemperatureScale) {
    var limits = getComfortableTemperatureLimits(season: season)

    if scale != .Celsius {
        limits.lowerLimit = convertToScale(temperature: limits.lowerLimit, from: .Celsius, to: scale)
        limits.upperLimit = convertToScale(temperature: limits.upperLimit, from: .Celsius, to: scale)
    }

    if temperature < limits.lowerLimit {
        let difference = Int(limits.lowerLimit - temperature)
        print("Please, make it warmer by \(difference) degrees.")
    } else if temperature > limits.upperLimit {
        let difference = Int(temperature - limits.upperLimit)
        print("Please, make it cooler by \(difference) degrees.")
    } else {
        print("The temperature is comfortable.")
    }
}

//  Проверяем, находится ли текущая влажность в пределах комфортного диапазона для выбранного сезона и шкалы измерения
func checkComfortableHumidity(humidity: Int, season: HumiditySeason) {
    let limits = getComfortableHumidityRange(season: season)

    if humidity < limits.lowerLimit {
        print("Please, increase the humidity by at least \(limits.lowerLimit - humidity)%.")
    } else if humidity > limits.upperLimit {
        print("Please, decrease the humidity by at least \(humidity - limits.upperLimit)%.")
    } else {
        print("The humidity is comfortable.")
    }
}

// Запускаем термометр
func startThermometer() {
    print("Enter temperature scale (Celsius, Kelvin, Fahrenheit):")
    guard let scaleString = readLine(), let scale = TemperatureScale(rawValue: scaleString) else {
        print("Incorrect input for temperature scale.")
        return
    }
    
    print("Enter season (S for summer, W for winter):")
    guard let seasonString = readLine()?.lowercased() else {
        print("Incorrect input for season.")
        return
    }
    
    let season: Season
    switch seasonString {
    case "s":
        season = .summer
    case "w":
        season = .winter
    default:
        print("Incorrect input for season.")
        return
    }
    
    print("Enter current temperature in Celsius:")
    guard let temperatureInput = readLine(), let temperature = Double(temperatureInput) else {
        print("Incorrect input for temperature.")
        return
    }
    
    print("Enter humidity in %:")
    guard let humidityString = readLine(), let humidity = Int(humidityString) else {
        print("Incorrect input for humidity.")
        return
    }
    
    let temperatureInScale = convertToScale(temperature: temperature, from: .Celsius, to: scale)
    printTemperature(temperature: temperatureInScale, scale: scale)
    printComfortableTemperatureRange(season: season, inScale: scale)
    checkComfortableTemperature(temperature: temperatureInScale, season: season, inScale: scale)
    
    let humiditySeason: HumiditySeason = (season == .summer) ? .summer : .winter
    printComfortableHumidityRange(season: humiditySeason)
    checkComfortableHumidity(humidity: humidity, season: humiditySeason)
}

startThermometer()

/*
 Input data:
 Celsius
 S
 17
 35
 
 Output data:
 The temperature is 17 ˚C
 The comfortable temperature is from 22 to 25 ˚C.
 Please, make it warmer by 5 degrees.
 The comfortable humidity is from 30% to 60%
 The humidity is comfortable
 
 */
