//
//  main.swift
//  quest3
//
//  Created by Aliia Satbakova  on 29.12.2023.
//

import Foundation
import RxSwift

func allStringsLongerThanFive(collection: Observable<String>) async -> Observable<Bool> {
    collection.map { $0.count > 5 }
}

func main() async {
    let firstCollection = Observable.of("first", "second", "third")
    let result = await allStringsLongerThanFive(collection: firstCollection)
    
    let disposeBag = DisposeBag()
    result.subscribe(onNext: { value in
        print(value)
    })
    .disposed(by: disposeBag)
}

await main()
