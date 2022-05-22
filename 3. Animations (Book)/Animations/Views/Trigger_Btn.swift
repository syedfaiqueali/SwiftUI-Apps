//
//  Trigger_Btn.swift
//  Animations
//
//  Created by Faiq on 28/01/2022.
//

import SwiftUI

struct Trigger_Btn: View {
    @State private var showButtons = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            //: HEADER VIEW
            VStack(spacing: 20) {
                TitleText("Triggers")
                SubtitleText("Button")
                BannerText("The tap of button triggers the start of animation", .black, .green)
                
                Spacer()
            }
            
            Group {
                //: BAG BUTTON
                Button(action: {showButtons.toggle() }) {
                    Image(systemName: "bag.badge.plus")
                        .padding(24)
                        .rotationEffect(.degrees(showButtons ? 0 : -90))
                }
                .background(Circle().fill(.green).shadow(radius: 8, x: 4, y: 4))
                .opacity(showButtons ? 1 : 0)
                .offset(x: 0, y: showButtons ? -150 : 0)
               
                //: GAUGE BUTTON
                Button(action: {showButtons.toggle() }) {
                    Image(systemName: "gauge.badge.plus")
                        .padding(24)
                        .rotationEffect(.degrees(showButtons ? 0 : 90))

                }
                .background(Circle().fill(.green).shadow(radius: 8, x: 4, y: 4))
                .offset(x: showButtons ? -110 : 0, y: showButtons ? -110 : 0)
                .opacity(showButtons ? 1 : 0)
                
                //: CALENDAR BUTTON
                Button(action: {showButtons.toggle() }) {
                    Image(systemName: "calendar.badge.plus")
                        .padding(24)
                        .rotationEffect(.degrees(showButtons ? 0 : 90))
                    
                }
                .background(Circle().fill(.green).shadow(radius: 8, x: 4, y: 4))
                .offset(x: showButtons ? -150 : 0, y: 0)
                .opacity(showButtons ? 1 : 0)
                
                //: PARENT BUTTON
                Button(action: {showButtons.toggle() }) {
                    Image(systemName: "plus")
                        .padding(24)
                        .rotationEffect(.degrees(showButtons ? 45 : 0))
                    
                }
                .background(Circle().fill(.green).shadow(radius: 8, x: 4, y: 4))
                
            } //: GROUP
            .padding(.trailing,20)
            .accentColor(.white)
            .animation(.default, value: showButtons)
            
        } //: ZSTACK
        .font(.title2)
        
    }
}

struct Trigger_Btn_Previews: PreviewProvider {
    static var previews: some View {
        Trigger_Btn()
    }
}
