//
//  main.swift
//  quest2
//
//  Created by Aliia Satbakova  on 29.12.2023.
//

import Foundation
import RxSwift

func findFirstElementStartingWithTh(collection: Observable<String>) async -> Observable<String> {
    collection.filter{ $0.hasPrefix("th") }
              .take(1) // получить только первый элемент
}

func main() async {
    let firstCollection = Observable.of("first", "second", "third")
    let result = await findFirstElementStartingWithTh(collection: firstCollection)
    
    let disposeBag = DisposeBag()
    result.subscribe(onNext: { value in
        print(value)
    })
    .disposed(by: disposeBag)
}

await main()
