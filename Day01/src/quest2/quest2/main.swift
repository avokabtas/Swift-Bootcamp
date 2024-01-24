//
//  main.swift
//  quest2
//
//  Created by Aliia Satbakova  on 13.12.2023.
//

import Foundation

extension String {
    func maskPhoneNumber() -> String {
        let allowedCharacters = CharacterSet(charactersIn: "0123456789+")
        let digits = self.components(separatedBy: allowedCharacters.inverted).joined()
        
        if (digits.count == 11 && (digits.hasPrefix("7") || digits.hasPrefix("8"))) || (digits.count == 12 && digits.hasPrefix("+7")) {
            var countryCode: String
            let operatorCode: String
            let remainingDigits: String
            
            if digits.hasPrefix("+7") {
                operatorCode = String(digits.dropFirst(2).prefix(3))
                remainingDigits = String(digits.dropFirst(5))
            } else {
                operatorCode = String(digits.hasPrefix("8") ? digits.dropFirst().prefix(3) : digits.prefix(3))
                remainingDigits = String(digits.dropFirst(operatorCode.count + 1))
            }
            
            let firstPart = remainingDigits.prefix(3)
            let secondPart = remainingDigits.dropFirst(3).prefix(2)
            let thirdPart = remainingDigits.dropFirst(5).prefix(2)
            
            if operatorCode == "800" {
                countryCode = "8"
                return "\(countryCode) (\(operatorCode)) \(firstPart) \(secondPart) \(thirdPart)"
            } else {
                countryCode = "+7"
                return "\(countryCode) \(operatorCode) \(firstPart)-\(secondPart)-\(thirdPart)"
            }
        }
        
        // Если номер не соответствует условиям, возвращаем исходную строку
        return self
    }
}

/* ____________ Пример ____________ */

func main() {
    let phoneNumber1 = "88005553535"
    let phoneNumber2 = "89152342343"
    let phoneNumber3 = "+79239992211"
    let phoneNumber4 = "+78001116677"
    
    print(phoneNumber1.maskPhoneNumber()) // Вывод: 8 (800) 555 35 35
    print(phoneNumber2.maskPhoneNumber()) // Вывод: +7 915 234-23-43
    print(phoneNumber3.maskPhoneNumber()) // Вывод: +7 923 999-22-11
    print(phoneNumber4.maskPhoneNumber()) // Вывод: 8 (800) 111 66 77
}

main()
