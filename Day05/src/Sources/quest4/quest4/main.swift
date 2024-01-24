//
//  main.swift
//  quest4
//
//  Created by Aliia Satbakova  on 29.12.2023.
//

import Foundation
import RxSwift

func areAnyStringsLongerThanFive(collection: Observable<String>) async -> Observable<Bool> {
    collection.map { $0.count > 5 }.reduce(true) { $0 || $1 }
}

func main() async {
    let firstCollection = Observable.of("first", "second", "third")
    let result = await areAnyStringsLongerThanFive(collection: firstCollection)
    
    let disposeBag = DisposeBag()
    result.subscribe(onNext: { value in
        print(value)
    })
    .disposed(by: disposeBag)
}

await main()
