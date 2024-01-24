//
//  main.swift
//  quest2
//
//  Created by Aliia Satbakova  on 04.01.2024.
//

import Foundation

// MARK: - Data Transfer Object

struct Flight {
    let flights: [FlightElement]
}

struct FlightElement {
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
    
    init(json: [String: Any]) {
        self.lastUpdatedAt = json["lastUpdatedAt"] as? String ?? ""
        self.actualLandingTime = json["actualLandingTime"] as? String
        self.flightName = json["flightName"] as? String ?? ""
        self.flightNumber = json["flightNumber"] as? Int ?? 0
        self.gate = json["gate"] as? String
        self.id = json["id"] as? String ?? ""
        self.airlineCode = json["airlineCode"] as? Int ?? 0
        self.scheduleDate = json["scheduleDate"] as? String ?? ""
        self.scheduleTime = json["scheduleTime"] as? String ?? ""
        self.terminal = json["terminal"] as? Int
    }
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

// MARK: - Object URL Session Service

class ObjectURLSessionService: IObjectService {
    
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
                let serialization = try JSONSerialization.jsonObject(with: data, options: [])
                
                // Проверяем на наличие ключа "flights" в словаре
                if let jsonDict = serialization as? [String: Any], let jsonArray = jsonDict["flights"] as? [[String: Any]] {
                    // Преобразование каждого словаря в jsonArray в объекты FlightElement
                    let flights = Flight(flights: jsonArray.map { FlightElement(json: $0) })
                    completion(.success(flights))
                } else {
                    completion(.failure(NetworkError.invalidData))
                }
            } catch {
                completion(.failure(error))
            }
        }
        .resume()
    }
    
}

// MARK: - Start

func main() {
    let objectService = ObjectURLSessionService()
    
    objectService.fetchDataFlights { result in
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
