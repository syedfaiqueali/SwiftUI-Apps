//
//  Shop.swift
//  Touchdown
//
//  Created by Faiq on 29/09/2021.
//

import Foundation

class Shop: ObservableObject {
    /**
     @Published will tell swiftUI that changes took place in the object
     */
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}
