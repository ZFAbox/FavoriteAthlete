//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Федор Завьялов on 28.04.2025.
//

struct Athlete {
    var name: String
    var age: Int
    var league: String
    var team: String
    var description: String {
        return "\(name) is \(age) years old and plays for the \(team) in the \(league)."
    }
}
