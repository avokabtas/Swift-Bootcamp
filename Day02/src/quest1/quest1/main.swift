//
//  main.swift
//  quest1
//
//  Created by Aliia Satbakova  on 18.12.2023.
//

import Foundation

// MARK: - Level

enum Level: String {
    case junior = "Junior"
    case middle = "Middle"
    case senior = "Senior"
}

// MARK: - Activity

enum Activity: String {
    case it = "IT"
    case banking = "Banking"
    case publicServices = "Public services"
}

// MARK: - Profession

enum Profession: String {
    case developer = "Developer"
    case qa = "QA"
    case projectManager = "Project Manager"
    case analyst = "Analyst"
    case designer = "Designer"
}

// MARK: - Company

class Company {
    var name: String = ""
    var activity: Activity
    var description: String = ""
    var jobs = [Jobs]()
    var skills = [String]()
    var contact: Int = 0
    
    struct Jobs {
        let profession: String
        let level: Level
        let salary: Int
    }
    
    init(name: String, activity: Activity, description: String, jobs: [Jobs], skills: [String], contact: Int) {
        self.name = name
        self.activity = activity
        self.description = description
        self.jobs = jobs
        self.skills = skills
        self.contact = contact
    }
    
    func interview(vacancy: Int, candidate: Candidate) -> Bool {
        guard vacancy >= 0 && vacancy < jobs.count else {
            print("Invalid vacancy number.")
            return false
        }
        
        let requiredSkillsSet = Set(skills)
        let candidateSkillsSet = Set(candidate.skills)
        
        let matchingSkills = requiredSkillsSet.intersection(candidateSkillsSet)
        let matchingPercentage = (Double(matchingSkills.count) / Double(requiredSkillsSet.count)) * 100
        
        if matchingPercentage < 50 {
            print("Candidate does not meet the required skills threshold.")
            return false
        }
        
        // Генерация случайного результата с использованием seed
        let randomSeed = 42 // Можно использовать любое число
        srand48(randomSeed)
        let isApplied = drand48() > 0.5 // Генерация случайного числа на основе seed
        
        return isApplied ? true : false
    }
}

// MARK: - Candidate

class Candidate {
    var name: String = ""
    var profession: Profession
    var level: Level
    var salary: Int = 0
    var skills = [String]()
    
    init(name: String, profession: Profession, level: Level, salary: Int, skills: [String]) {
        self.name = name
        self.profession = profession
        self.level = level
        self.salary = salary
        self.skills = skills
    }
    
    func printInfo() {
        print("Candidate:")
        print("- Name: \(name)")
        print("- Profession: \(profession.rawValue)")
        print("- Level: \(level.rawValue)")
        print("- Salary: \(salary)")
        print("- Skills: \(skills)")
    }
}

// Создание компаний
func createCompanies() -> [Company] {
    var companies = [Company]()
    
    let companyParams: [(name: String, activity: Activity, description: String, jobs: [Company.Jobs], skills: [String], contact: Int)] = [
        (
            name: "OOO \"SuperPay\"",
            activity: .banking,
            description: "Banking company description",
            jobs: [Company.Jobs(profession: "Developer", level: .junior, salary: 100000)],
            skills: ["python", "matlab", "tensorflow", "excel"],
            contact: 123456
        ),
        (
            name: "MMM",
            activity: .publicServices,
            description: "Сompany description",
            jobs: [Company.Jobs(profession: "Developer", level: .middle, salary: 100000)],
            skills: ["excel", "access"],
            contact: 666666
        ),
        (
            name: "CryptoSuperGo",
            activity: .banking,
            description: "Banking company description",
            jobs: [Company.Jobs(profession: "Developer", level: .junior, salary: 100000)],
            skills: ["python", "sql", "matlab", "pandas"],
            contact: 454578
        ),
        (
            name: "Tinkoff",
            activity: .banking,
            description: "Banking company description",
            jobs: [Company.Jobs(profession: "Developer", level: .junior, salary: 100000)],
            skills: ["python", "matlab"],
            contact: 912323
        ),
        (
            name: "MTS",
            activity: .banking,
            description: "Banking company description",
            jobs: [Company.Jobs(profession: "Developer", level: .junior, salary: 100000)],
            skills: ["python", "matlab", "excel"],
            contact: 789008
        ),
        
    ]
    
    for params in companyParams {
        let company = Company(
            name: params.name,
            activity: params.activity,
            description: params.description,
            jobs: params.jobs,
            skills: params.skills,
            contact: params.contact
        )
        companies.append(company)
    }
    
    return companies
}

/* ____________ Пример ____________ */

// Создаем пять компаний
let fiveCompanies = createCompanies()

// Создаем кандидата
let candidate = Candidate(
    name: "Ivan",
    profession: .developer,
    level: .junior,
    salary: 100000,
    skills: ["python", "matlab"]
)

// Выводим информацию о кандидате
candidate.printInfo()

// Отображение подходящих вакансий для кандидата
print("\(candidate.profession). \(candidate.level.rawValue). >= \(candidate.salary)")
print("The list of suitable vacancies: \n")
var index = 1
for company in fiveCompanies {
    for job in company.jobs {
        if job.profession == candidate.profession.rawValue && job.salary >= candidate.salary {
            print("\(index).")
            print("\(job.profession) --- >= \(job.salary)")
            print("  \(company.name)")
            print("  \(company.activity.rawValue)")
            print("  \(company.skills)")
            print("---------------------------------------")
            index += 1
        }
    }
}

// Ввод номера вакансии для интервью (cимуляция процесса)
func startInterview() {
    print("Enter the number of the vacancy for the interview:")
    if let vacancyNumber = readLine(), let vacancy = Int(vacancyNumber) {
        var isCandidateApplied = false
        
        guard vacancy > 0 else {
            print("Invalid vacancy number.")
            //exit(0)
            startInterview()
            return
        }
        
        var vacancyIndex = vacancy - 1
        var foundCompany: Company?
        
        for company in fiveCompanies {
            if vacancyIndex < company.jobs.count {
                foundCompany = company
                break
            } else {
                vacancyIndex -= company.jobs.count
            }
        }
        
        guard let company = foundCompany else {
            print("Invalid vacancy number.")
            //exit(0)
            startInterview()
            return
        }
        
        print("Proccessing Interview...")
        let isApplied = company.interview(vacancy: vacancyIndex, candidate: candidate)
        
        if isApplied {
            isCandidateApplied = true
            print("Success, candidate was applied.")
        }
        if !isCandidateApplied {
            print("Unfortunately, the candidate was not applied.")
        }
        
    } else {
        print("It doesn't look like a correct input.")
        startInterview()
    }
}

startInterview()
