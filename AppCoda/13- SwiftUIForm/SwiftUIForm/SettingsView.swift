//
//  SettingsView.swift
//  SwiftUIForm
//
//  Created by Syed Faiq on 01/04/2022.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var selectedOrder = DisplayOrderType.alphabetical
    @State private var showCheckInOnly = false
    @State private var maxPriceLevel = 5
    
    @Environment(\.presentationMode) var presentationMode
    
    var settingStore: SettingStore
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("SORT PREFERENCE")) {
                    Picker(selection: $selectedOrder, label: Text("Display Order")) {
                        ForEach(DisplayOrderType.allCases, id: \.self) { orderType in
                            Text(orderType.text)
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
                    //1-Save values
                    self.settingStore.showCheckInOnly = self.showCheckInOnly
                    self.settingStore.displayOrder = self.selectedOrder
                    self.settingStore.maxPriceLevel = self.maxPriceLevel
                    
                    //2- Dismiss
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Save")
                        .foregroundColor(.black)
                })
            )
        }
        .onAppear {
            self.selectedOrder = self.settingStore.displayOrder
            self.showCheckInOnly = self.settingStore.showCheckInOnly
            self.maxPriceLevel = self.settingStore.maxPriceLevel
        } //Load saved settings onAppear
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(settingStore: SettingStore())
    }
}
