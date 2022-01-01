//
//  Animation Challange.swift
//  Animations
//
//  Created by Faiq on 29/12/2021.
//

import SwiftUI

struct Animation_Challange: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Example")
            SubtitleText("Parts of Animations")
            
            Circle()
                .foregroundColor(.orange)
                .frame(width: 100, height: 100)
                //.offset(x: change ? 140 : -140, y: change ? 440 : 0)  //diagonal
                //.offset(x: 0, y: change ? 440 : 0)
                .hueRotation(Angle.degrees(change ? 90 : 0))
                //.animation(Animation.linear, value: change)
            
            Spacer()
            
            Button("Change") {
                self.change.toggle()
            }
            .padding(.bottom)
        }
        .font(.title)
    }
}

struct Animation_Challange_Previews: PreviewProvider {
    static var previews: some View {
        Animation_Challange()
    }
}
