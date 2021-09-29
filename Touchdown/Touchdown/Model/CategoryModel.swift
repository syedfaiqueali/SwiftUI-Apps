//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Faiq on 24/09/2021.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
