//
//  main.swift
//  quest2
//
//  Created by Aliia Satbakova  on 23.12.2023.
//

import Foundation

// MARK: - IBarista

protocol IBarista {

    func brew(_ coffee: Coffee)
}

// MARK: - Barista Machine

class BaristaMachine: IBarista {
    var modelName: String
    private var preparationTime = 60 / 60
    private var coffeeVolume = 0.3
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    private func getCoffeeBrewingTime() -> String {
        let time = String(preparationTime / Int(coffeeVolume + 1))
        return time
    }
    
    func brew(_ coffee: Coffee) {
        print("\(coffee.name) is brewing. \(getCoffeeBrewingTime()) minute - time left")
        print("Coffee is ready!")
    }
}

// MARK: - Select Barista

func selectBarista() -> Int {
    print("Choose barista:")
    print("1. Man")
    print("2. Machine")

    var baristaChoice: Int?
    repeat {
        if let input = readLine(), let choice = Int(input) {
            if choice == 1 || choice == 2 {
                baristaChoice = choice
            } else {
                print("Try again!")
            }
        } else {
            print("Try again!")
        }
    } while baristaChoice == nil

    return baristaChoice!
}

// MARK: - Format Price

func formatPrice(_ price: Double) -> String {
    let formattedPrice: String
    let priceString = String(format: "%.2f", price)
    
    if price.truncatingRemainder(dividingBy: 1) == 0 {
        // Цена без дробной части - 2$
        formattedPrice = String(format: "%.0f$", price)
    } else if priceString.hasSuffix("0") {
        // Если число не является целым, но оканчивается на 0 после второго знака - 1.5$
        formattedPrice = String(format: "%.1f$", price)
    } else {
        // 1.35$
        formattedPrice = String(format: "%.2f$", price)
    }
    
    return formattedPrice
}

// MARK: - Display Menu

func displayMenu(menu: [Coffee], discounted: Bool) {
    for (index, coffee) in menu.enumerated() {
        let price = (discounted) ? (coffee.price * 0.9) : coffee.price
        let formattedPrice = formatPrice(price)
        print("\(index + 1). \(coffee.name) \(formattedPrice)")
    }
}

// MARK: - Start

func startMenu() {
    // Меню кофе
    let cappuccino = Coffee("Cappuccino", price: 2)
    let americano = Coffee("Americano", price: 1.5)
    let latte = Coffee("Latte", price: 2.3)
    let menu: [Coffee] = [cappuccino, americano, latte]
    
    // Выбираем кто готовит
    let baristaChoice = selectBarista()

    if baristaChoice == 1 {
        let baristaPerson = Barista("Robert", surname: "Pattinson", employmentHistory: 5)
        
        print("Choose coffee in menu:")
        displayMenu(menu: menu, discounted: false)
        if let choice = readLine(), let selectedChoice = Int(choice), selectedChoice > 0, selectedChoice <= menu.count {
            let selectedCoffee = menu[selectedChoice - 1]
            baristaPerson.brew(selectedCoffee)
        } else {
            print("Try again!")
        }
    } else {
        let baristaMachine = BaristaMachine(modelName: "DeLonghi")
        
        print("Choose coffee in menu:")
        displayMenu(menu: menu, discounted: true)
        if let choice = readLine(), let selectedChoice = Int(choice), selectedChoice > 0, selectedChoice <= menu.count {
            let selectedCoffee = menu[selectedChoice - 1]
            baristaMachine.brew(selectedCoffee)
        } else {
            print("Try again!")
        }
    }
}

startMenu()
