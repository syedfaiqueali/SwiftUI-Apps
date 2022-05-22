//
//  ContentView.swift
//  Implicit Animations
//
//  Created by Faiq on 02/04/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    
    @State private var isLoading = false
    
    var body: some View {
        
        
        ZStack {
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 14)
                .frame(width: 100, height: 100)
            
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(Color.green, lineWidth: 5)
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                .onAppear() {
                    self.isLoading = true
            }
        }
        
//        ZStack {
//            Circle()
//                .frame(width: 200, height: 200)
//                .foregroundColor(circleColorChanged ? Color(.systemGray5) : .red)
//
//            Image(systemName: "heart.fill")
//                .foregroundColor(heartColorChanged ? .red : .white)
//                .font(.system(size: 100))
//                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
//        }
//        .onTapGesture {
//            withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)) {
//                self.circleColorChanged.toggle()
//                self.heartColorChanged.toggle()
//                self.heartSizeChanged.toggle()
//            }
//        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
