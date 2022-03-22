//
//  ContentView.swift
//  SwiftUIState
//
//  Created by Syed Faiq on 22/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var counterRed = 1
    @State private var counterBlue = 1
    @State private var counterGreen = 1
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("\(counterRed + counterBlue + counterGreen)")
                .font(.system(size: 150, weight: .bold, design: .rounded))
                .foregroundColor(.black)
            Spacer()
            
            HStack {
                CounterButton(counter: $counterRed, color: .red)
                CounterButton(counter: $counterBlue, color: .blue)
                CounterButton(counter: $counterGreen, color: .green)
            }.padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CounterButton: View {
    @Binding var counter: Int
    
    var color: Color
    
    var body: some View {
        Button(action: {
            self.counter += 1
        }){
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(color)
                .overlay(
                    Text("\(counter)")
                        .font(.system(size: 60, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                )
        }
        
    }
}
