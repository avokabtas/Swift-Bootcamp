//
//  main.swift
//  quest5
//
//  Created by Aliia Satbakova  on 29.12.2023.
//

import Foundation
import RxSwift

func checksForEmptyStrings(collection: Observable<String>) async -> Observable<Bool> {
    collection.map { !$0.isEmpty }
}

func main() async {
    let firstCollection = Observable.of("first", "second", "third", "")
    let result = await checksForEmptyStrings(collection: firstCollection)
    
    let disposeBag = DisposeBag()
    result.subscribe(onNext: { value in
        print(value)
    })
    .disposed(by: disposeBag)
}

await main()
