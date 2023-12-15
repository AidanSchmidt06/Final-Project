//
//  workoutviewmodel.swift
//  Yoked Test full
//
//  Created by Aidan Schmidt24 on 11/20/23.
//

import Foundation



class WorkoutViewModel: ObservableObject {
    @Published var isDarkMode : Bool = false

    @Published var items: [WorkoutModel] = []

    init() {

        getItems()

    }

    func getItems() {

        let newItems = [WorkoutModel(exercise: "Squats", reps: 10, sets: 3, weight: 150, isCompleted: false), WorkoutModel(exercise: "Deadlift", reps: 8, sets: 4, weight: 250, isCompleted: true)

        ]

        items.append(contentsOf: newItems)

    }

    func deleteItem(indexSet: IndexSet) {

        items.remove(atOffsets: indexSet)

    }

    func moveItem(from: IndexSet, to: Int) {

        items.move(fromOffsets: from, toOffset: to)

    }

    func addItem(exercise: String, sets: Int, reps: Int, weight: Int) {

        let newItem = WorkoutModel(exercise: exercise, reps: reps, sets: sets, weight: weight, isCompleted: false)

        items.append(newItem)

    }

    func updateItem(item: WorkoutModel) {
        
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            
            items[index] = item.updateCompletion()
            
        }
    }
    
        
        
        

    }




