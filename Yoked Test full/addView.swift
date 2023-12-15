//
//  addView.swift
//  Yoked Test full
//
//  Created by Aidan Schmidt24 on 11/20/23.
//

import SwiftUI
import PhotosUI





struct AddView: View {
    
    let isDark : Bool
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var WorkoutViewModel: WorkoutViewModel
    @State var textFieldText: String = ""
    
    // for the add item page insufficient text alert
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    // Variable for stepper amount
    @State var setsAmount = 3
    @State var repsAmount = 10
    @State var weightAmount = 50
    
    @State private var avatarImage: UIImage?
    @State private var photosPickerItem: PhotosPickerItem?
    
    var body: some View {
        ScrollView{
            VStack{
                
                TextField("Type something here...", text: $textFieldText)
                
                    .padding(.horizontal)
                    .frame(height: 65)
                    .background(Color.yellow)
                    .cornerRadius(10)
                
                Text("Sets: \(setsAmount)")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(isDark ? .teal : .blue)
                Stepper("Enter an amount: \(setsAmount)", value: $setsAmount, in: 0...10)
                    .labelsHidden()
                Text("Reps: \(repsAmount)")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(isDark ? .pink : .red)
                Stepper("Enter an amount: \(repsAmount)", value: $repsAmount, in: 0...100)
                    .labelsHidden()
                Text("Weight (lbs): \(weightAmount)")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(isDark ? .mint : .green)
                Stepper("Enter an amount: \(weightAmount)", onIncrement: {weightAmount += 5}, onDecrement: {weightAmount -= 5})
                    .labelsHidden()
                // Use a stepper to get integers. That could be cool!
                Button(action: saveButtonPressed,
                       
                       label: {
                    
                    Text("Save".uppercased())
                    
                        .foregroundColor(Color.white)
                    
                        .frame(height: 55)
                    
                        .frame(maxWidth: .infinity)
                    
                        .background(Color.accentColor)
                    
                        .cornerRadius(10)
                    
                }
                       
                )
                VStack{
                    HStack{
                        PhotosPicker(selection: $photosPickerItem) {
                            Image(uiImage: avatarImage ?? UIImage(imageLiteralResourceName: "running"))
                        }
                    }
                    
                    
                    .padding(14)
                    .onChange(of: photosPickerItem) { _ in
                        Task{
                            if let photosPickerItem,
                               let data = try? await photosPickerItem.loadTransferable(type: Data.self){
                                if let image = UIImage (data: data) {
                                    avatarImage = image
                                }
                            }
                            photosPickerItem = nil
                        }
                    }
                }
                .navigationTitle("Add A Workout")
                
                .alert(isPresented: $showAlert, content: getAlert)
                
            }
            
            .background(isDark ? Color.black : Color.white)

        }
    }
    func saveButtonPressed() {
        
        if textIsAppropriate() {
            
            WorkoutViewModel.addItem(exercise: textFieldText, sets: setsAmount, reps: repsAmount, weight: weightAmount)
            
            presentationMode.wrappedValue.dismiss()
            
        }
        
    }
    
    func textIsAppropriate() -> Bool {
        
        if textFieldText.count < 3 {
            
            alertTitle = "Your new todo item must be at least 3 characters long! 🥸"
            
            showAlert.toggle()
            
            return false
            
        }
        
        return true
        
    }
    
    func getAlert() -> Alert {
        
        return Alert(title: Text(alertTitle))
        
    }
    
}

        
        
        
        struct AddView_Previews: PreviewProvider {
            
            static var previews: some View {
                
                NavigationView{
                    
                    AddView(isDark : true)
                   
                    
                }
                .environmentObject(WorkoutViewModel())
                
            }
            
        }
