//
//  main.swift
//  quest1
//
//  Created by Aliia Satbakova  on 29.12.2023.
//

import Foundation
import RxSwift

func filterCollectionE(collection: Observable<String>) async -> Observable<String> {
    collection.filter{ $0.contains("e") }
}

func main() async {
    let firstCollection = Observable.of("first", "second", "third")
    let result = await filterCollectionE(collection: firstCollection)

    let disposeBag = DisposeBag()
    result.subscribe(onNext: { value in
        print(value)
    })
    .disposed(by: disposeBag)
}

await main()
