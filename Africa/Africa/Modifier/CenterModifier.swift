//
//  CenterModifier.swift
//  Africa
//
//  Created by Faiq on 12/09/2021.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
