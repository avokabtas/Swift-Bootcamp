//
//  main.swift
//  quest3
//
//  Created by Aliia Satbakova  on 20.12.2023.
//

import Foundation

// MARK: - Player Status

enum PlayerStatus {
    case IN_PLAY
    case SEARCH
    case IDLE
    case OFFLINE
}

// MARK: - Player Action

protocol PlayerAction {
    func findOpponent(for player: Profile) -> Profile?
}

// MARK: - Profile

class Profile {
    let id: UUID
    let nickname: String
    let age: Int
    let name: String
    let revolver: Revolver
    let creationDate = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)
    var status: PlayerStatus = .OFFLINE
    
    lazy var profileURL: String = {
        return "http://gameserver.com/\(id)-\(nickname)"
    }()
    
    var playerActionDelegate: PlayerAction?
    
    init(nickname: String, age: Int, name: String, revolver: Revolver) {
        self.id = UUID()
        self.nickname = nickname
        self.age = age
        self.name = name
        self.revolver = revolver
    }
    
    func profileInfo() -> String {
        return "Profile(\"\(nickname)\", \(status))"
    }
    
    func findOpponent() {
        status = .SEARCH
        guard (playerActionDelegate?.findOpponent(for: self)) != nil else {
            print("No opponent found")
            status = .IDLE
            return
        }
    }
    
}

// MARK: - Server

class Server: PlayerAction {
    let serverAddress: String
    var playerProfiles: [Profile] = []
    
    init(serverAddress: String) {
        self.serverAddress = serverAddress
    }
    
    func add(players: [Profile]) {
        for player in players {
            playerProfiles.append(player)
            player.playerActionDelegate = self // Устанавливаем делегат
        }
    }
    
    func findOpponent(for player: Profile) -> Profile? {
        for opponent in playerProfiles where opponent.status == .SEARCH && opponent.nickname != player.nickname {
            opponent.status = .IN_PLAY
            player.status = .IN_PLAY
            return opponent
        }
        return nil
    }
    
    func printProfileInfo() {
        for player in playerProfiles {
            print(player.profileInfo())
        }
    }
}

// MARK: - Revolver

// Заглушка (полный код в quest2)
class Revolver {
    let caliber: Int
    
    init(caliber: Int) {
        self.caliber = caliber
    }
}

/* ____________ Пример ____________ */

func testStartGame() {

    let gameServer = Server(serverAddress: "www.testServer.ru")
    
    // Все игроки
    let playerOne = Profile(nickname: "potter", age: 30, name: "Harry", revolver: Revolver(caliber: 32))
    let playerTwo = Profile(nickname: "weasley", age: 30, name: "Ron", revolver: Revolver(caliber: 32))
    let playerThree = Profile(nickname: "granger", age: 31, name: "Hermione", revolver: Revolver(caliber: 32))
    let playerFour = Profile(nickname: "longbottom", age: 30, name: "Neville", revolver: Revolver(caliber: 32))
    // Игрок, который ищет оппонента
    let playerSearcher = Profile(nickname: "malfoy", age: 30, name: "Draco", revolver: Revolver(caliber: 32))
    
    // Установили статусы игрокам
    playerOne.status = .SEARCH
    playerTwo.status = .IDLE
    playerThree.status = .IN_PLAY
    playerFour.status = .SEARCH
    playerSearcher.status = .IDLE
    
    print("SearcherProfile:")
    print(playerSearcher.profileInfo())
    
    print("\nServerProfiles:")
    gameServer.add(players: [playerOne, playerTwo, playerThree, playerFour, playerSearcher])
    gameServer.printProfileInfo()
    
    print("\n-----")
    
    print("\nStart Search")
    print("SearcherProfile:")
    playerSearcher.status = .SEARCH
    print(playerSearcher.profileInfo())
    print("ServerProfiles:")
    gameServer.printProfileInfo()
    
    print("\n-----")
    
    print("\nResult Search")
    playerSearcher.status = .SEARCH
    print("SearcherProfile:")
    print(playerSearcher.profileInfo())
    let resultInfo = gameServer.findOpponent(for: playerSearcher)
    resultInfo?.status = .SEARCH
    if let opponent = resultInfo {
        print("Opponent:")
        print(opponent.profileInfo())
    } else {
        print("No opponent found")
    }
    playerSearcher.findOpponent()
    
    print("ServerProfiles:")
    gameServer.printProfileInfo()
}

testStartGame()
