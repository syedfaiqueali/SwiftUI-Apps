//
//  Animate_RotationEffect.swift
//  Animations
//
//  Created by Faiq on 05/01/2022.
//

import SwiftUI

struct Animate_RotationEffect: View {
    
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 10) {
            TitleText("Animatable Properties")
            SubtitleText("Rotation Effect")
            BannerText("Rotations are also animatable", .white, .blue)
            
            Button("Change"){
                self.change.toggle()
            }
            .font(.title)
            
            Spacer()
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.blue)
                .frame(width: 250, height: 150)
                .overlay(Image(systemName: "arrow.up").foregroundColor(.white).font(.title2))
                .rotationEffect(Angle.degrees(change ? 220 : 0))
                .padding()
                .animation(.easeInOut, value: change)
            
            Spacer()
        }
    }
}

struct Animate_RotationEffect_Previews: PreviewProvider {
    static var previews: some View {
        Animate_RotationEffect()
    }
}
