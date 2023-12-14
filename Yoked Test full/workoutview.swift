//
//  workoutview.swift
//  Yoked Test full
//
//  Created by Aidan Schmidt24 on 11/20/23.
//

import SwiftUI



struct WorkoutView: View {
    @EnvironmentObject var WorkoutViewModel: WorkoutViewModel
    
    
    
    
    
    var body: some View {
            Grid{
                GridRow{
                    ForEach(WorkoutViewModel.items) {item in
                        WorkoutRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    WorkoutViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: WorkoutViewModel.deleteItem)
                    .onMove(perform: WorkoutViewModel.moveItem)
                    
                    .navigationTitle("Workouts!")
                    .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView()))
                }
                GridRow{
                    Image("workout-quotes-fred-devito-1671640194")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 500)
                    
                        
                    
                }
                
        }
    }
    
}
struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WorkoutView()
        }
        .environmentObject(WorkoutViewModel())
    }

}





