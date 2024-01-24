//
//  main.swift
//  quest1
//
//  Created by Aliia Satbakova  on 04.01.2024.
//

import Foundation

// MARK: - Data Transfer Object

struct Flight: Codable {
    let flights: [FlightElement]
}

struct FlightElement: Codable {
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

// MARK: - Network Error

enum NetworkError: Error {
    case invalidResponse
    case invalidData
}

/* Все работает ок. Просто тестирую.

// MARK: - Schiphol API Client

class SchipholAPIClient: IObjectService {
    
    let baseURL: URL = URL(string: "https://api.schiphol.nl/public-flights")!
    private let session = URLSession.shared
    
    func fetchDataFlights(completion: @escaping (Result<Flight, Error>) -> Void) {
        let flightsURL = baseURL.appendingPathComponent("flights")
        
        var request = URLRequest(url: flightsURL)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("d98411cb", forHTTPHeaderField: "app_id")
        request.addValue("a3d16c47b0edd770eb26eb59394103be", forHTTPHeaderField: "app_key")
        request.addValue("v4", forHTTPHeaderField: "ResourceVersion")
        
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let flightsResponse = try decoder.decode(Flight.self, from: data)
                completion(.success(flightsResponse))
            } catch {
                completion(.failure(error))
            }
            
        }
        .resume()
    }
}

// MARK: - Start

func main() {
    let schiphol = SchipholAPIClient()
    
    schiphol.fetchDataFlights { result in
        switch result {
        case .success(let flights):
            print(flights)
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

*/
