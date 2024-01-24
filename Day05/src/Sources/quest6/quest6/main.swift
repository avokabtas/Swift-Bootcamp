//
//  main.swift
//  quest6
//
//  Created by Aliia Satbakova  on 29.12.2023.
//

import Foundation
import RxSwift

func totalLengthOfStrings(collection: Observable<String>) async -> Observable<Int> {
    collection.map {$0.count}
        .reduce(0, accumulator: +)
}

func main() async {
    let firstCollection = Observable.of("first", "second", "third")
    let result = await totalLengthOfStrings(collection: firstCollection)
    
    let disposeBag = DisposeBag()
    result.subscribe(onNext: { value in
        print(value)
    })
    .disposed(by: disposeBag)
}

await main()
