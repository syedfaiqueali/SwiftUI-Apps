//
//  Animate_Trim.swift
//  Animations
//
//  Created by Faiq on 05/01/2022.
//

import SwiftUI

struct Animate_Trim: View {
    @State private var change = false
    @State private var circleProgress: CGFloat = 1.0
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animatable Properties")
            SubtitleText("Trim")
            BannerText("Animating the trim of circle is a great way to show progress", .white, .blue)
            
            Button("Change"){
                self.change.toggle()
                circleProgress = change ? 0.25 : 1
            }
            
            Spacer()
            
            Circle()
                .trim(from: 0, to: circleProgress)
                .stroke(Color.blue, style: StrokeStyle(lineWidth:40, lineCap: CGLineCap.round))
                .frame(height:300)
                .rotationEffect(.degrees(-90)) //Start from top
                .padding(40)
                .animation(.default, value: change)
            
            Spacer()
        }
        .font(.title)
    }
}

struct Animate_Trim_Previews: PreviewProvider {
    static var previews: some View {
        Animate_Trim()
    }
}
