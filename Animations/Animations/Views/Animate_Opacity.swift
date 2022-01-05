//
//  Animate_Opacity.swift
//  Animations
//
//  Created by Faiq on 05/01/2022.
//

import SwiftUI

struct Animate_Opacity: View {
    
    @State private var show = false
    
    var body: some View {
        VStack(spacing: 10) {
            TitleText("Animatable Properties")
            SubtitleText("Opacity")
            BannerText("Opacity is the thickness, solidness or opaqueness. The more opacity the more solid occurs.", .white, .blue)
            
            Button("Show/Hide"){
                self.show.toggle()
            }
            .font(.title)
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.blue)
                .padding()
                .opacity(show ? 1 : 0)
                .animation(.easeInOut, value: show)
//            Spacer()
//            Circle()
//                .foregroundColor(.blue)
//                .frame(width: 100, height: 100, alignment: .center)
//                .padding()
//                .opacity(show ? 1 : 0)
//                .animation(.easeInOut, value: show)
//
//            Spacer()
        }
    }
}

struct Animate_Opacity_Previews: PreviewProvider {
    static var previews: some View {
        Animate_Opacity()
    }
}
