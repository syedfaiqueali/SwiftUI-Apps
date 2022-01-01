//
//  HomeViewModel.swift
//  Bag Animations
//
//  Created by Faiq on 29/12/2021.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var showCart = false
    @Published var selectedSize = ""
    
    //Animation Properties
    @Published var startAnimation = false
    @Published var shoeAnimation = false
    
}

