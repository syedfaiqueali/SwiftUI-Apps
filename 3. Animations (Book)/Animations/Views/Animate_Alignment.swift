//
//  Animate_Alignment.swift
//  Animations
//
//  Created by Faiq on 29/12/2021.
//

import SwiftUI

struct Animate_Alignment: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animatable Properties")
            SubtitleText("Alignment change")
            BannerText("You can animate the alignment inside a container view", .white, .blue)
            
            VStack(alignment: change ? .trailing : .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                    .frame(width: 100, height: 100)
                    .animation(.default, value: change)
                
                HStack {
                    Spacer()
                }
            }
            
            BannerText("Inside an HStack", .white, .blue)
            
            HStack(alignment: change ? .bottom : .top) {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                    .frame(width: 100, height: 100)
                    .animation(.default, value: change)
                
                VStack {
                    Spacer()
                }
            }
            .frame(maxHeight: .infinity)
            
            Button("Change") {
                self.change.toggle()
            }
        }
        .font(.title)
    }
}

struct Animate_Alignment_Previews: PreviewProvider {
    static var previews: some View {
        Animate_Alignment()
    }
}
