//
//  main.swift
//  quest1
//
//  Created by Aliia Satbakova  on 06.01.2024.
//

import Foundation

// MARK: - User

class User {
    var id: Int
    var name: String
    var dateOfBirth: String
    var email: String
    
    init(id: Int, name: String, dateOfBirth: String, email: String) {
        self.id = id
        self.name = name
        self.dateOfBirth = dateOfBirth
        self.email = email
    }
    
    var description: String {
        return "User(id: \(id), name: \(name), dateOfBirth: \(dateOfBirth), email: \(email))"
    }
}

// MARK: - Network Service

protocol NetworkService {
    func getAListOfUsers() -> [User]
}

// MARK: - Network Service Impl

class NetworkServiceImpl: NetworkService {
    func getAListOfUsers() -> [User] {
        // Заглушечный список заранее определенных объектов
        let userOne = User(id: 1, name: "Harry Potter", dateOfBirth: "31.07.1980", email: "theSpecialOne@gmail.com")
        let userTwo = User(id: 2, name: "Hermione Granger", dateOfBirth: "19.09.1979", email: "theSmartGirl@gmail.com")
        let userThree = User(id: 3, name: "Ron Weasley", dateOfBirth: "01.03.1980", email: "theGingerBoy@gmail.com")
        
        return [userOne, userTwo, userThree]
    }
}

// MARK: - Database Service

protocol DatabaseService {
    func saveAListOfUsers(users: [User])
}

// MARK: - Release Database Service Impl

class ReleaseDatabaseServiceImpl: DatabaseService {
    func saveAListOfUsers(users: [User]) {
        // print("Release: \(users) were saved")
        let userNames = users.map { $0.name }.joined(separator: ", ")
        print("Release: [\(userNames)] were saved")
    }
}

// MARK: - Debug Database Service Impl

class DebugDatabaseServiceImpl: DatabaseService {
    func saveAListOfUsers(users: [User]) {
        // print("Debug: \(users) were saved")
        let userNames = users.map { $0.name }.joined(separator: ", ")
        print("Debug: [\(userNames)] were saved")
    }
}

// MARK: - User Repository

class UserRepository {
    private let networkService: NetworkService
    private let databaseService: DatabaseService
    
    init(networkService: NetworkService, databaseService: DatabaseService) {
        self.networkService = networkService
        self.databaseService = databaseService
    }
    
    func updateUserInfo() {
        let users = networkService.getAListOfUsers()
        databaseService.saveAListOfUsers(users: users)
    }
}

/*
func main () {
    
    // Объекты классов
    let networkServiceImpl = NetworkServiceImpl()
    let releaseDatabaseServiceImpl = ReleaseDatabaseServiceImpl()
    let debugDatabaseServiceImpl = DebugDatabaseServiceImpl()
    
    // Release
    let releaseUserRepository = UserRepository(networkService: networkServiceImpl, databaseService: releaseDatabaseServiceImpl)
    releaseUserRepository.updateUserInfo()
    
    // Debug
    let debugUserRepository = UserRepository(networkService: networkServiceImpl, databaseService: debugDatabaseServiceImpl)
    debugUserRepository.updateUserInfo()
}

main()
*/
