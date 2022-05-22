//
//  ContentView2.swift
//  Calculator
//
//  Created by Faiq on 12/10/2021.
//

import SwiftUI

struct ContentView2: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(0 ..< 10) { item in
                        CustomListCellView()
                    }
                }
            }
            .navigationTitle("Coupons")
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
