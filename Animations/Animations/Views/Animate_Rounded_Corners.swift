//
//  Animate_Rounded_Corners.swift
//  Animations
//
//  Created by Faiq on 05/01/2022.
//

import SwiftUI

struct Animate_Rounded_Corners: View {
    
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 10) {
            TitleText("Animatable Properties")
            SubtitleText("Rotation Effect")
            BannerText("You can animate the size of an object through the frame modifier's height and width parameters", .white, .blue)
            
            Button("Change"){
                self.change.toggle()
            }
            
            RoundedRectangle(cornerRadius: change ? 0 : 70)
                .fill(.blue)
                .padding()
                .animation(.easeInOut, value: change)
            
            Text("About to change its corner radius")
                .foregroundColor(.white)
                .padding(25)
                .background(.blue)
                .cornerRadius(change ? 0 : 70)
                .animation(.easeInOut, value: change)
        }
        .font(.title)
    }
}

struct Animate_Rounded_Corners_Previews: PreviewProvider {
    static var previews: some View {
        Animate_Rounded_Corners()
    }
}
