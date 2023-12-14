//
//  workoutmodel.swift
//  Yoked Test full
//
//  Created by Aidan Schmidt24 on 11/20/23.
//

import Foundation



struct WorkoutModel: Identifiable{

    let id: String

    let exercise: String

    var reps: Int = 2

    var sets: Int = 2

    var weight: Int = 2

    let isCompleted: Bool

    

    init(id: String = UUID().uuidString, exercise: String, reps: Int, sets: Int, weight: Int, isCompleted: Bool) {

        self.id = UUID().uuidString

        self.exercise = exercise

        self.reps = reps

        self.sets = sets

        self.weight = weight

        self.isCompleted = isCompleted

    }

    

    func updateCompletion () -> WorkoutModel {

        return WorkoutModel(id: id, exercise: exercise, reps: reps, sets: sets, weight: weight, isCompleted: !isCompleted)

    }

}

