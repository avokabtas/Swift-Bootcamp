//
//  main.swift
//  quest3
//
//  Created by Aliia Satbakova  on 04.01.2024.
//

import Foundation
import Alamofire

// MARK: - Data Transfer Object

struct Flight: Decodable {
    let flights: [FlightElement]
}

struct FlightElement: Decodable {
    let lastUpdatedAt: String
    let actualLandingTime: String?
    let flightName: String
    let flightNumber: Int
    let gate: String?
    let id: String
    let airlineCode: Int
    let scheduleDate: String
    let scheduleTime: String
    let terminal: Int?
}

// MARK: - Protocol

protocol IObjectService {
    var baseURL: URL { get }
    func fetchDataFlights(completion: @escaping (Result<Flight, Error>) -> Void)
}

// MARK: - Object Alamofire Service

class ObjectAlamofireService: IObjectService {
    
    let baseURL: URL = URL(string: "https://api.schiphol.nl/public-flights")!
    
    func fetchDataFlights(completion: @escaping (Result<Flight, Error>) -> Void) {
        let flightsURL = baseURL.appendingPathComponent("flights")
        
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "app_id": "d98411cb",
            "app_key": "a3d16c47b0edd770eb26eb59394103be",
            "ResourceVersion": "v4"
        ]
        
        AF.request(flightsURL, method: .get, headers: headers).responseDecodable(of: Flight.self) { response in
            switch response.result {
            case .success(let decodedResponse):
                completion(.success(decodedResponse))
                print(decodedResponse.flights) // Печатаем все полеты
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
    
}

// MARK: - Start

func main() {
    let objectService = ObjectAlamofireService()

    objectService.fetchDataFlights { result in
        switch result {
        case .success(let flightsResponse):
            print(flightsResponse.flights)
        case .failure(let error):
            print(error)
        }
    }

    // Искусственная задержка для имитации асинхронного запроса
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        print("\nCompleted fetching data!")
    }
}

main()
dispatchMain()
