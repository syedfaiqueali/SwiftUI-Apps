//
//  BannerText.swift
//  Animations
//
//  Created by Faiq on 29/12/2021.
//

import SwiftUI

struct BannerText: View {
    var text: String
    var textColor: Color
    var backColor: Color
    
    var body: some View {
        Text(text)
            .font(.title)
            .frame(maxWidth: .infinity)
            .padding()
            .background(backColor)
            .foregroundColor(textColor)
    }
    
    init(_ text: String, _ textColor: Color, _ backColor: Color) {
        self.text = text
        self.textColor = textColor
        self.backColor = backColor
    }
}

