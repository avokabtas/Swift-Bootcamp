//
//  main.swift
//  quest10
//
//  Created by Aliia Satbakova  on 29.12.2023.
//

import Foundation
import RxSwift

struct Sample {
    let id: Int
    let text: String
}

// Массив
//func groupsValuesByIdAndCount(collection: Observable<Sample>) async -> Single<[Int: Int]> {
//    return collection.toArray().map { samples in
//        var groups: [Int: Int] = [:]
//        
//        for sample in samples {
//            if let count = groups[sample.id] {
//                groups[sample.id] = count + 1
//            } else {
//                groups[sample.id] = 1
//            }
//        }
//        
//        return groups
//    }
//}

// Строка
func groupsValuesByIdAndCount(collection: Observable<Sample>) async -> Single<String> {
    return collection.reduce([Int: Int]()) { (result, sample) in
        var newResult = result
        newResult[sample.id] = (newResult[sample.id] ?? 0) + 1
        return newResult
    }
    .map { dictionary in
        let pairs = dictionary.map { key, value in
            "Pair(\(key), \(value))"
        }
        return "listOf(\(pairs.joined(separator: ", ")))"
    }
    .asSingle()
}

func main() async {
    let secondCollection = Observable.of(
        Sample(id: 1, text: "some text"),
        Sample(id: 1, text: "any text"),
        Sample(id: 2, text: "more text"),
        Sample(id: 2, text: "other text"),
        Sample(id: 3, text: "too text")
    )

    let result = await groupsValuesByIdAndCount(collection: secondCollection)

    let disposeBag = DisposeBag()
    result.subscribe(onSuccess: { value in
        print(value)
    }, onFailure: { error in
        print("Error: \(error)")
    })
    .disposed(by: disposeBag)
}

await main()
