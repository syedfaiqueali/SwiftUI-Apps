//
//  FactModel.swift
//  Avocados
//
//  Created by Faiq on 26/11/2021.
//

import SwiftUI

//MARK: FACT MODEL

struct Fact: Identifiable {
    var id = UUID()
    var image: String
    var content: String
}

