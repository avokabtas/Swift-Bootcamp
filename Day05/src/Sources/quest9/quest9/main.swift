//
//  main.swift
//  quest9
//
//  Created by Aliia Satbakova  on 29.12.2023.
//

import Foundation
import RxSwift

struct Sample {
    let id: Int
    let text: String
}

func groupsValuesById(collection: Observable<Sample>) async -> Single<[Int: [String]]> {
    return collection.groupBy { $0.id }
        .flatMap { group -> PrimitiveSequence<SingleTrait, (Int, [String])> in
            return group.map { $0.text }.toArray()
                .map { texts -> (Int, [String]) in
                    (group.key, texts)
                }
        }
        .toArray()
        .map { pairs -> [Int: [String]] in
            Dictionary(pairs, uniquingKeysWith: { $1 })
        }
}

func main() async {
    let secondCollection = Observable.of(
        Sample(id: 1, text: "some text"),
        Sample(id: 1, text: "any text"),
        Sample(id: 2, text: "more text"),
        Sample(id: 2, text: "other text"),
        Sample(id: 3, text: "too text")
    )

    let result = await groupsValuesById(collection: secondCollection)

    let disposeBag = DisposeBag()
    result.subscribe(onSuccess: { value in
        print(value)
    }, onFailure: { error in
        print("Error: \(error)")
    })
    .disposed(by: disposeBag)
}

await main()
