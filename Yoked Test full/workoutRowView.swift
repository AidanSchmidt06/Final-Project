//
//  workoutRowView.swift
//  Yoked Test full
//
//  Created by Aidan Schmidt24 on 11/20/23.
//

import SwiftUI



struct WorkoutRowView: View {
    let item: WorkoutModel
    let isDark : Bool
    
    var body: some View {
        Grid{
            GridRow{
                HStack{
                    Image(systemName:  "checkmark.circle")
                        .foregroundColor(item.isCompleted ? .green : .red)
                    Text(item.exercise)
                        .foregroundStyle(isDark ? .white : .black)
//                    WorkoutRowView(item: WorkoutModel, isDark: true)
//                        .foregroundStyle(.white)
                    
                    Text("\(item.reps)")
                        .foregroundStyle(isDark ? . pink : .red)
                    Text("\(item.sets)")
                        .foregroundStyle(isDark ? .teal : .blue)
                    Text("\(item.weight)")
                        .foregroundStyle(isDark ? .mint : .green)
                    Spacer()
                }
                .font(.title2)
                .padding(.vertical, 8)
            }
        }
    }
    
}
    
    //#Preview {
    //    WorkoutRowView()
    //}
    struct WorkoutRowView_Previews: PreviewProvider{
        static var item1 = WorkoutModel(exercise: "Squats", reps: 10, sets: 3, weight: 150, isCompleted: false)
        
        static var item2 = WorkoutModel(exercise: "Deadlift", reps: 8, sets: 4, weight: 250, isCompleted: true)
        
        
        static var previews: some View{
            Group{ WorkoutRowView(item: item1, isDark: true)
                WorkoutRowView(item: item2, isDark: true)
            }
            
            .previewLayout(.sizeThatFits)
            
        }
        
    }

