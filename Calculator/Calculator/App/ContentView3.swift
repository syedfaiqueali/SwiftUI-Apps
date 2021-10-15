//
//  ContentView3.swift
//  Calculator
//
//  Created by Faiq on 12/10/2021.
//

import SwiftUI

struct ContentView3: View {
    let rows = [
        ["7", "8", "9", "÷"],
        ["4", "5", "6", "×"],
        ["1", "2", "3", "−"],
        [".", "0", "=", "+"]
    ]
    
    @State var finalValue: String = "0.0"
    
    var body: some View {
        VStack {
            HStack() {
                Text(finalValue)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color.black)
                    .frame(width: 320, height: 180, alignment: .bottomTrailing)
            }
            .frame(minWidth: 0, idealWidth: 320, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: 200, alignment: .top)
            .background(Color.white)
            
            
            HStack {
                VStack{
                    Spacer()
                }
                VStack(alignment: .center, spacing: 20) {
                    ForEach(rows, id: \.self) { row in
                        HStack {
                            ForEach(row, id: \.self) { column in
                                Button(action: {
                                    self.finalValue = column
                                }, label: {
                                    Text("\(column)")
                                        .font(.title)
                                        .foregroundColor(Color.black)
                                })
                                .frame(width: 80, height: 80, alignment: .center)
                                .background(Color.white)
                                .cornerRadius(40)
                                .shadow(radius: 10)
                            }
                        }
                    }
                }
            }
            .frame(minWidth: 0, idealWidth: 320, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .top)
            .background(Color.white)
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
