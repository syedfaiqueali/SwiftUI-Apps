//
//  TitleText.swift
//  Animations
//
//  Created by Faiq on 29/12/2021.
//

import SwiftUI

struct TitleText: View {
    var title = ""
    var body: some View {
        Text(title)
            .font(.largeTitle)
    }
    
    init(_ title: String) {
        self.title = title
    }
}
