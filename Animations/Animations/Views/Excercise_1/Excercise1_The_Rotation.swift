//
//  Excercise1_The_Rotation.swift
//  Animations
//
//  Created by Faiq on 28/01/2022.
//

import SwiftUI

struct Excercise1_The_Rotation: View {
    @State private var change = false
    var offsetValue: CGFloat = 200
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Excercise")
            SubtitleText("Move Shapes with offsets")
            BannerText("Need to move each shape with rotation effect when the change occurs", .white, .red)
            
            Spacer()
            
            VStack(spacing: 1) {
                HStack(alignment: .bottom, spacing: 1){
                    Rectangle()
                        .frame(width:70, height:35)
                        .offset(x: change ? 0 : -offsetValue) //Move left
                    Rectangle()
                        .frame(width:35, height:70)
                        .offset(y: change ? 0 : -offsetValue) // Move up
                }
                .offset(x: -18)
                HStack(alignment: .top, spacing: 1){
                    Rectangle()
                        .frame(width:36, height:72)
                        .offset(y: change ? 0 : offsetValue) //Move down
                    Rectangle()
                        .frame(width:72, height:36)
                        .offset(x: change ? 0 : offsetValue) //Move right
                }
                .offset(x: 18)
            }
            .rotationEffect(.degrees(change ? 0 : -90))
            .foregroundColor(change ? .red : .orange)
            .opacity(change ? 1 : 0)
            .animation(.default, value: change)
            
            
            Spacer()
            
            Button("Change"){
                self.change.toggle()
            }
            .foregroundColor(.red)
            .padding(.bottom)
        }
        .font(.title)
    }
}

struct Excercise1_The_Rotation_Previews: PreviewProvider {
    static var previews: some View {
        Excercise1_The_Rotation()
    }
}
