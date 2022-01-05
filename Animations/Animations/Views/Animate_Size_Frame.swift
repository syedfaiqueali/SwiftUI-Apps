//
//  Animate_Size_Frame.swift
//  Animations
//
//  Created by Faiq on 05/01/2022.
//

import SwiftUI

struct Animate_Size_Frame: View {
    
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 10) {
            TitleText("Animatable Properties")
            SubtitleText("Rotation Effect")
            BannerText("You can animate the size of an object through the frame modifier's height and width parameters", .white, .blue)
            
            Button("Change"){
                self.change.toggle()
            }
            .font(.title)
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.blue)
                //.frame(width: change ? 100 : 350, height: change ? 100 : 200)
                .padding()
                .scaleEffect(change ? 0.5 : 1)
                .animation(.easeInOut, value: change)
            
            BannerText("Notice how this changes the layout of the screen. You may want to consider animating with the scaleEffect instead", .white, .blue)
        }
        //.animation(.easeInOut, value: change) //so that VStack also animate
    }
}

struct Animate_Size_Frame_Previews: PreviewProvider {
    static var previews: some View {
        Animate_Size_Frame()
    }
}
