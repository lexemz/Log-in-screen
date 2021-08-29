//
//  UserModel.swift
//  Log-in screen
//
//  Created by Igor on 29.08.2021.
//

import Foundation

struct User {
    let userName: String
    let userPassword: String
    let userInfo: Human
    
    static func mockObject() -> Self {
        let skills = [
            Skill(title: "Git", skillLevel: .skilled),
            Skill(title: "JS", skillLevel: .confident),
            Skill(title: "Docker", skillLevel: .beginner),
            Skill(title: "Swift", skillLevel: .beginner),
            Skill(title: "UIKit", skillLevel: .beginner)
        ]
        
        let hobbies = [
            Hobbie(
                title: "Сборка кастомных клавиатур",
                description: "Собираю кастомные механические клавиатуры на любой цвет, вкус, бюджет"
            ),
            Hobbie(
                title: "Люблю кушать",
                description: "Вторым любимым хобби является готовка блюд, примущественно итальянской и азитской кухни, а так же поедание приготовленного :)"
            ),
            Hobbie(
                title: "Узнавать новое в IT",
                description: "Люблю читать литературу, связанную с компьютерными технологиями. Сейчас пытаюсь осилить \"Архитектуру Компьютера\" Таненбаума"
            )
        ]
        
        let education = [
            Education(
                nameOfOrganization: "Школа (не помню номер уже)",
                educationDirection: nil,
                eduType: .secondary,
                yearEnd: 2017
            ),
            Education(
                nameOfOrganization: "РТУ МИРЭА",
                educationDirection: "Программная инжинерия",
                eduType: .high,
                yearEnd: 2021
            )
        ]
        
        let human = Human(
            name: "Igor",
            surname: "Buzykin",
            age: 22,
            skills: skills,
            hobbies: hobbies,
            education: education)
        
        return User(
            userName: "igor",
            userPassword: "123",
            userInfo: human)
    }
}

struct Human {
    let name: String
    let surname: String?
    let age: Int?
    
    let skills: [Skill]?
    let hobbies: [Hobbie]?
    let education: [Education]?
}

struct Skill {
    enum SkillLevel: String {
        case beginner = "Начинающий"
        case confident = "Продолжающий"
        case skilled = "Опытный"
    }
    
    let title: String
    let skillLevel: SkillLevel
    
    var getInfo: String {
        "- Навык: \(title).\n Уровень понимания: \(skillLevel.rawValue)\n\n"
    }
}

struct Hobbie {
    let title: String
    let description: String
    
    var getInfo: String {
        "- Хобби: \(title). \(description)\n"
    }
}

struct Education {
    enum TypeOfEducation: String {
        case secondary = "Среднее"
        case high = "Высшее"
    }
    
    let nameOfOrganization: String
    let educationDirection: String?
    let eduType: TypeOfEducation
    let yearEnd: Int
    
    var getInfo: String {
        """
        \(eduType.rawValue) образование:
        Год окончания: \(yearEnd)
        Название организации: \(nameOfOrganization)
        Направление: \(educationDirection ?? "общее")
        \n
        """
    }
}

