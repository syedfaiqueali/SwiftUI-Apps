//
//  SettingsView.swift
//  SwiftUIForm
//
//  Created by Syed Faiq on 01/04/2022.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var selectedOrder = 0
    @State private var showCheckInOnly = false
    @State private var maxPriceLevel = 5
    
    @Environment(\.presentationMode) var presentationMode
    
    private var displayOrders = [ "Alphabetical", "Show Favorite First", "Show Check-i n First"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("SORT PREFERENCE")) {
                    Picker(selection: $selectedOrder, label: Text("Display Order")) {
                        ForEach(0 ..< displayOrders.count, id: \.self) {
                            Text(self.displayOrders[$0])
                        }
                    }
                }
                
                Section(header: Text("FILTER PREFERENCE")) {
                    Toggle(isOn: $showCheckInOnly) {
                        Text("Show check in only")
                    }
                    
                    Stepper {
                        self.maxPriceLevel = self.maxPriceLevel < 5 ? maxPriceLevel+1 : 5
                    } onDecrement: {
                        self.maxPriceLevel = self.maxPriceLevel > 1 ? maxPriceLevel-1 : 1
                    } label: {
                        Text("Show \(String(repeating: "$", count: maxPriceLevel)) or below")
                    }
                    
                }
            }
            .navigationBarTitle(Text("Settings"))
            .navigationBarItems(
                leading: Button(action: {
                    //dimiss
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.black)
                }),
                trailing: Button(action: {
                    //dismiss
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Save")
                        .foregroundColor(.black)
                })
            )
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
