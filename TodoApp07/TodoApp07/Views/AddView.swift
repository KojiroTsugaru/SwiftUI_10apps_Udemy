//
//  AddView.swift
//  TodoApp07
//
//  Created by KJ on 1/3/23.
//

import SwiftUI

struct AddView: View {
    
    // dismiss a view
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var list: ListViewModel
    
    @State var textFieldText: String = ""
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
 
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.gray).opacity(0.2))
                    .cornerRadius(10)
                Button(action: saveButtonTapped, label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                })
            }.padding(16)
        }.navigationTitle("Add an Item")
            .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonTapped(){
        if textIsValid() {
            list.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsValid() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your todos shold contain at least 3 charactors!"
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
            AddView()
        }
    }
}
