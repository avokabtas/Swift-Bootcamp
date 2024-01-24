//
//  main.swift
//  quest5
//
//  Created by Aliia Satbakova  on 12.12.2023.
//

import Foundation

func getResult(coordinate x1: Double, coordinate y1: Double, radius r1: Double,
               coordinate x2: Double, coordinate y2: Double, radius r2: Double) {
    // Рассчитываем расстояние между центрами окружностей с помощью формулы расстояния между двумя точками на плоскости
    let distance = sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2))
    
    // Проверяем различные варианты пересечения окружностей на основе их расстояния и радиусов
    if distance <= abs(r1 - r2) {
        print("One circle is inside another")
    } else if distance <= r1 + r2 {
        // Если расстояние меньше суммы радиусов, окружности пересекаются
        
        // Вычисляем длину отрезка, который соединяет центры окружностей
        let a = (pow(r1, 2) - pow(r2, 2) + pow(distance, 2)) / (2 * distance)
        // Вычисляем высоту треугольника, образованного центрами окружностей и точкой пересечения
        let h = sqrt(pow(r1, 2) - pow(a, 2))
        
        let deltaX = x2 - x1 // Изменение по оси X между точками x2 и x1
        let deltaY = y2 - y1 // Изменение по оси Y между точками y2 и y1
        
        let x3 = x1 + a * (deltaX) / distance
        let x4 = x3 + h * (deltaY) / distance
        let x5 = x3 - h * (deltaY) / distance
        
        let y3 = y1 + a * (deltaY) / distance
        let y4 = y3 - h * (deltaX) / distance
        let y5 = y3 + h * (deltaX) / distance
        
        // Находятся координаты точек пересечения окружностей
        let intersectionPoints = [[x4, y4], [x5, y5]]
        print("The circles intersect at points: \(intersectionPoints)")
    } else {
        // Если ни одно из условий не выполнено, окружности не пересекаются
        print("The circles do not intersect")
    }
}

func checkCircleIntersection() {
    print("Enter coordinates and radii of two circles (x1 y1 r1 x2 y2 r2) separated by spaces:")
    // Считываем ввод
    guard let input = readLine() else { return }
    // Разбиваем ввод на отдельные значения и конвертируем их в Double
    let values = input.split(separator: " ").compactMap { Double($0) }
    
    // Проверяем на количество чисел
    guard values.count == 6 else {
        print("Couldn't parse a number. Please, try again.")
        checkCircleIntersection() // Предлагаем пользователю ввести заново все данные
        return
    }
    
    // Извлекаем координаты и радиусы окружностей из массива значений
    let x1 = values[0], y1 = values[1], r1 = values[2]
    let x2 = values[3], y2 = values[4], r2 = values[5]
    
    // Вызываем функцию для определения взаимного расположения окружностей
    getResult(coordinate: x1, coordinate: y1, radius: r1, coordinate: x2, coordinate: y2, radius: r2)
    
    print("Do you want to check again? (Y/N)")
    if let response = readLine()?.lowercased(), response == "y" {
        checkCircleIntersection() // Предлагаем пользователю ввести заново все данные
    }
}

checkCircleIntersection()

/*
 Input data: 0.0  1.0  1.0  2.0  1.0  1.0
 Output data: The circles intersect  [ [1.0, 1.0] ]
 */
