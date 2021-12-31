//
//  Login_Animations.swift
//  Animations
//
//  Created by Faiq on 31/12/2021.
//

import SwiftUI

struct Login_Animations: View {
    @State private var show = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Challange")
            SubtitleText("Show Login")
            
            BannerText("Already have a account?", .black, .white)
                .padding(.top, 80)
            Button("Login now") {
                self.show.toggle()
            }
            
            HStack() {
                VStack() {
                    Text("Username")
                    Text("Password")
                }.padding()
                Spacer()
            }
            .padding()
            .animation(.easeOut, value: show)
            .opacity(show ? 1 : 0)
            .background(show ? Color.blue : Color.clear)
            
            Spacer()
        }
    }
}

struct Login_Animations_Previews: PreviewProvider {
    static var previews: some View {
        Login_Animations()
    }
}
