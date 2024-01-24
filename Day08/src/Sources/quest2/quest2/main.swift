//
//  main.swift
//  quest2
//
//  Created by Aliia Satbakova  on 06.01.2024.
//

import Foundation
import Swinject

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

//____________________ quest 2 ____________________\\

// MARK: - using Factory Method

func getObjectUsingFactoryMethod() {
    let container = Container()

    container.register(NetworkService.self, factory:  { _ in NetworkServiceImpl()  })
    container.register(DatabaseService.self, factory: { _ in ReleaseDatabaseServiceImpl()  })
    container.register(UserRepository.self) { resolver in
        let networkService = resolver.resolve(NetworkService.self)!
        let databaseService = resolver.resolve(DatabaseService.self)!
        return UserRepository(networkService: networkService, databaseService: databaseService)
    }

    if let userRepositoryOne = container.resolve(UserRepository.self) {
        userRepositoryOne.updateUserInfo()
        
        if let userRepositoryTwo = container.resolve(UserRepository.self) {
            print("User repositories are equal: \(userRepositoryOne === userRepositoryTwo)")
        }
    }
}

// MARK: - using Named Dependencies

func getObjectUsingNamedDependencies() {
    let container = Container()

    container.register(NetworkService.self) { _ in NetworkServiceImpl() }
    container.register(DatabaseService.self, name: "release") { _ in ReleaseDatabaseServiceImpl() }
    container.register(DatabaseService.self, name: "debug") { _ in DebugDatabaseServiceImpl() }
    
    container.register(UserRepository.self, name: "release") { resolver in
        let networkService = resolver.resolve(NetworkService.self)!
        let databaseService = resolver.resolve(DatabaseService.self, name: "release")!
        return UserRepository(networkService: networkService, databaseService: databaseService)
    }
    
    container.register(UserRepository.self, name: "debug") { resolver in
        let networkService = resolver.resolve(NetworkService.self)!
        let databaseService = resolver.resolve(DatabaseService.self, name: "debug")!
        return UserRepository(networkService: networkService, databaseService: databaseService)
    }

    if let userRepositoryOne = container.resolve(UserRepository.self, name: "release") {
        userRepositoryOne.updateUserInfo()
    }

    if let userRepositoryTwo = container.resolve(UserRepository.self, name: "debug") {
        userRepositoryTwo.updateUserInfo()
    }
}

// MARK: - Single Instance

func getSingletonInstance() {
    let container = Container()

    container.register(NetworkService.self) { _ in NetworkServiceImpl() }
    container.register(DatabaseService.self) { _ in ReleaseDatabaseServiceImpl() }
    container.register(UserRepository.self) { resolver in
        let networkService = resolver.resolve(NetworkService.self)!
        let databaseService = resolver.resolve(DatabaseService.self)!
        return UserRepository(networkService: networkService, databaseService: databaseService)
    }
    .inObjectScope(.container)

    if let userRepositoryOne = container.resolve(UserRepository.self) {
        userRepositoryOne.updateUserInfo()
        
        if let userRepositoryTwo = container.resolve(UserRepository.self) {
            print("User repositories are equal: \(userRepositoryOne === userRepositoryTwo)")
        }
    }
}

// MARK: - Main

func main() {
    print("--- Factory Method:")
    getObjectUsingFactoryMethod()
    
    print("--- Named Dependencies:")
    getObjectUsingNamedDependencies()
    
    print("--- Singleton Instance:")
    getSingletonInstance()
}

main()
