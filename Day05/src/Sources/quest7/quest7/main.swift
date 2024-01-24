//
//  main.swift
//  quest7
//
//  Created by Aliia Satbakova  on 29.12.2023.
//

import Foundation
import RxSwift

func countsTheNumberOfStrings(collection: Observable<String>) async -> Single<Int> {
    collection.toArray()
        .map { $0.count }
}

func main() async {
    let firstCollection = Observable.of("first", "second", "third")
    let result = await countsTheNumberOfStrings(collection: firstCollection)
    
    let disposeBag = DisposeBag()
    result.subscribe(onSuccess: { value in
        print(value)
    }, onFailure: { error in
        print("Error: \(error)")
    })
    .disposed(by: disposeBag)
}

await main()

