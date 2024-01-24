//
//  main.swift
//  quest2
//
//  Created by Aliia Satbakova  on 18.12.2023.
//

import Foundation

// MARK: - Profession

enum Profession: String {
    case developer = "Developer"
    case qa = "QA"
    case projectManager = "Project Manager"
    case analyst = "Analyst"
    case designer = "Designer"
}

// MARK: - Sex

enum Sex: String {
    case male = "Male"
    case female = "Female"
}

// MARK: - Candidate

class Candidate {
    var name: String = ""
    var profession: Profession
    var sex: Sex
    var birthDate: String = ""
    var contacts: String = ""
    
    init(name: String, profession: Profession, sex: Sex, birthDate: String, contacts: String) {
        self.name = name
        self.profession = profession
        self.sex = sex
        self.birthDate = birthDate
        self.contacts = contacts
    }
    
    func candidateInfoAsString() -> String {
        var result = "# Candidate info\n"
        result += "\(name)\n"
        result += "\(profession.rawValue)\n"
        result += "\(sex.rawValue)\n"
        result += "\(birthDate)\n"
        result += "\(contacts)\n"
        return result
    }
}

// MARK: - Education

class Education {
    var type: String = ""
    var yearsOfStudy: String = ""
    var description: String = ""
    
    init(type: String, yearsOfStudy: String, description: String) {
        self.type = type
        self.yearsOfStudy = yearsOfStudy
        self.description = description
    }
    
    func educationInfoAsString() -> String {
        var result = "\n# Education\n"
        result += "\(type)\n"
        result += "\(yearsOfStudy)\n"
        result += "\(description)\n"
        return result
    }
}

// MARK: - Work

class Work {
    var workingPeriod: String = ""
    var companyName: String = ""
    var description: String = ""
    
    init(workingPeriod: String, companyName: String, description: String) {
        self.workingPeriod = workingPeriod
        self.companyName = companyName
        self.description = description
    }
    
    func workInfoAsString() -> String {
        var result = "##\n"
        result += "\(workingPeriod)\n"
        result += "\(companyName)\n"
        result += "\(description)\n"
        return result
    }
}

// MARK: - Person

class Person {
    var profession: Profession
    var description: String = ""
    
    init(profession: Profession, description: String) {
        self.profession = profession
        self.description = description
    }
    
    func aboutPersonAsString() -> String {
            var result = "\n# Free block\n"
            result += "I'm \(profession.rawValue) specialist."
            result += " \(description)\n"
            return result
        }
}

// Чтение данных из файлов
func readTextFromFile(named fileName: String, path: String) -> String? {
    let fileURL = URL(fileURLWithPath: path).appendingPathComponent(fileName)
    do {
        let text = try String(contentsOf: fileURL, encoding: .utf8)
        return text
    } catch {
        print("Error reading file: \(error)")
        return nil
    }
}

func main() {
    let basePath = "/Users/aliiasatbakova/Swift_Bootcamp.Day02-1/src/files/"
    
    if let resumeTextFile = readTextFromFile(named: "resume.txt", path: basePath),
       let tagsTextFile = readTextFromFile(named: "tags.txt", path: basePath) {
        
        // Запись данных объектов в файл export.txt
        let candidate = Candidate(name: "Petrov Petr Petrovich", profession: .qa, sex: .male, birthDate: "10.10.1993", contacts: "petrov@gmail.com")
        let education = Education(type: "higher", yearsOfStudy: "2008-2012", description: "Studied to be a programmer")
        let work1 = Work(workingPeriod: "2012-2013", companyName: "OOO \"Good Company\"", description: "Worked as QA")
        let work2 = Work(workingPeriod: "2013-2020", companyName: "Tinkoff", description: "Worked as QA and Java")
        let work3 = Work(workingPeriod: "2020-2023", companyName: "Sber", description: "Worked as QA and Java")
        let person = Person(profession: .qa, description: "I love my work.")
        
        // Формирование данных для экспорта
        let candidateInfo = candidate.candidateInfoAsString()
        let educationInfo = education.educationInfoAsString()
        let work1Info = work1.workInfoAsString()
        let work2Info = work2.workInfoAsString()
        let work3Info = work3.workInfoAsString()
        let personInfo = person.aboutPersonAsString()
        
        // Соединение всех данных в одну строку для экспорта
        let exportText = candidateInfo + educationInfo + "\n# Job experience\n" + work1Info + work2Info + work3Info + personInfo
        
        let exportFilePath = basePath + "export.txt"
        do {
            try exportText.write(toFile: exportFilePath, atomically: true, encoding: .utf8)
            print("Exported data to export.txt")
        } catch {
            print("Error exporting data: \(error)")
        }
        
        // Анализ текста резюме для подсчета слов и сравнения с облаком тегов
        let words = resumeTextFile.components(separatedBy: .whitespacesAndNewlines).filter { !$0.isEmpty }
        
        // Подсчет повторений слов
        var wordCounts: [String: Int] = [:]
        for word in words {
            if let count = wordCounts[word] {
                wordCounts[word] = count + 1
            } else {
                wordCounts[word] = 1
            }
        }
        
        // Сортировка слов по количеству повторений, исключая определенные слова и символы
        let sortedWordCounts = wordCounts.filter { word, count in
            let excludedWords = ["...", "#", "##"] // Список исключенных слов и символов
            return !excludedWords.contains(word) // Исключить слова из списка исключений
        }.sorted { $0.value > $1.value }
        
        // Запись результатов анализа в файл analysis.txt
        var analysisText = "# Words\n"
        for (word, count) in sortedWordCounts {
            analysisText += "\(word) - \(count)\n"
        }
        
        // Проверка слов, совпадающих с тегами из tags.txt
        let tagWords = tagsTextFile.components(separatedBy: .whitespacesAndNewlines).filter { !$0.isEmpty }
        analysisText += "\n# Matched tags\n"
        for word in tagWords {
            if wordCounts[word] != nil {
                analysisText += "\(word)\n"
            }
        }
        
        let analysisFilePath = basePath + "analysis.txt"
        do {
            try analysisText.write(toFile: analysisFilePath, atomically: true, encoding: .utf8)
            print("Analysis data written to analysis.txt")
        } catch {
            print("Error writing analysis data: \(error)")
        }
    }
}

// ------------------------
// Перед запуском очистить файлы export.txt и analysis.txt
main()
