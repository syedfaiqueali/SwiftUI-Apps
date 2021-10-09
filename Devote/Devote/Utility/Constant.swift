//
//  Constant.swift
//  Devote
//
//  Created by Faiq on 01/10/2021.
//

import SwiftUI

// MARK:- FORMATTER
let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()


// MARK:- UI
var backgroundGradient: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]),
                          startPoint: .top,
                          endPoint: .bottomTrailing)
}

// MARK:- UX
let feedback = UINotificationFeedbackGenerator()
