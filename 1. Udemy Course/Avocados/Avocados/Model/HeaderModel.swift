//
//  HeaderModel.swift
//  Avocados
//
//  Created by Faiq on 25/11/2021.
//

import SwiftUI

//MARK: HEADER MODEL

struct Header: Identifiable {
    var id = UUID()
    var image: String
    var headline: String
    var subheadline: String
}
