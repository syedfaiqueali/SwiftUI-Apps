//
//  Excercise1_TheSetup.swift
//  Animations
//
//  Created by Faiq on 14/01/2022.
//

import SwiftUI

struct Excercise1_TheSetup: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Excercise")
            SubtitleText("The Setup")
            BannerText("“The first thing you want to do is to build the end state of your animation. This will be WAY easier than building the begin state and trying to animate it together.", .white, .red)
            
            Spacer()
            
            VStack(spacing: 1) {
                HStack(alignment: .bottom, spacing: 1){
                    Rectangle()
                        .frame(width:70, height:35)
                    Rectangle()
                        .frame(width:35, height:70)
                }
                .offset(x: -18)
                HStack(alignment: .top, spacing: 1){
                    Rectangle()
                        .frame(width:36, height:72)
                    Rectangle()
                        .frame(width:72, height:36)
                }
                .offset(x: 18)
            }
            .opacity(change ? 1 : 0)
            .animation(.default, value: change)
            .foregroundColor(change ? .red : .orange)
            
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

struct Excercise1_TheSetup_Previews: PreviewProvider {
    static var previews: some View {
        Excercise1_TheSetup()
    }
}
