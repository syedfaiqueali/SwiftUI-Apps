//
//  SubtitleText.swift
//  Animations
//
//  Created by Faiq on 29/12/2021.
//

import SwiftUI

struct SubtitleText: View {
    var subtitle = ""
    var body: some View {
        Text(subtitle)
            .font(.title)
            .foregroundColor(.gray)
    }
    
    init(_ subtitle: String) {
        self.subtitle = subtitle
        
    }
}
