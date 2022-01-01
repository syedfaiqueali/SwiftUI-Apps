//
//  Example_NoAnimations.swift
//  Animations
//
//  Created by Faiq on 29/12/2021.
//

import SwiftUI

struct Example_NoAnimations: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Example")
            SubtitleText("Parts of Animations")
            BannerText("The button changes a variable that then changes a view's property. That property change causes a change on the screen", .black, .orange)
            
            Circle()
                .foregroundColor(.orange)
                .frame(width: 100, height: 100)
                .offset(x: 0, y: change ? 250 : 0)
                .animation(Animation.easeInOut, value: change)
            
            Spacer()
            
            Button("Change") {
                self.change.toggle()
            }
            .padding(.bottom)
        }
        .font(.title)
    }
}

struct Example_NoAnimations_Previews: PreviewProvider {
    static var previews: some View {
        Example_NoAnimations()
    }
}
