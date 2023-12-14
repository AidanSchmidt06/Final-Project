//
//  Yoked_Test_fullApp.swift
//  Yoked Test full
//
//  Created by Aidan Schmidt24 on 11/20/23.
//


import SwiftUI

@main

struct WorkoutApp: App {

    @StateObject var workoutViewModel: WorkoutViewModel = WorkoutViewModel()


    var body: some Scene {

        WindowGroup {

            NavigationView{

            WorkoutView()
            }
            .environmentObject(workoutViewModel)

        }

    }

}
