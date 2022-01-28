//
//  Excercise1_The_Rotation.swift
//  Animations
//
//  Created by Faiq on 28/01/2022.
//

import SwiftUI

struct Excercise1_The_Rotation: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Excercise")
            SubtitleText("Rotate with Rotation Effect")
            BannerText("Add a rotation modifier and change the degrees. It rotates depending on the change in variable", .white, .red)
            
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
