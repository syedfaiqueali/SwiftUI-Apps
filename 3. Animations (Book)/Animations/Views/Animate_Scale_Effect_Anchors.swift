//
//  Animate_Scale_Effect_Anchors.swift
//  Animations
//
//  Created by Faiq on 05/01/2022.
//

import SwiftUI

struct Animate_Scale_Effect_Anchors: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 10) {
            TitleText("Animatable Properties")
            SubtitleText("Rotation Effect")
            BannerText("You can animate the size of an object through the frame modifier's height and width parameters", .white, .blue)
            
            Button("Change"){
                self.change.toggle()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.blue)
                .scaleEffect(change ? 1 : 0.25, anchor: .top)
                .animation(.default, value: change)
                .overlay(Text("Scale from Top").foregroundColor(.white))
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.blue)
                .scaleEffect(change ? 0.25 : 1, anchor: .trailing)
                .animation(.default, value: change)
                .overlay(Text("Scale from Right").foregroundColor(.white))
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.blue)
                .scaleEffect(change ? 1 : 0.5, anchor: .bottomLeading)
                .animation(.default, value: change)
                .overlay(Text("Scale from Bottom Left").foregroundColor(.white))
            
            
        }
        .font(.title)
    }
}

struct Animate_Scale_Effect_Anchors_Previews: PreviewProvider {
    static var previews: some View {
        Animate_Scale_Effect_Anchors()
    }
}
