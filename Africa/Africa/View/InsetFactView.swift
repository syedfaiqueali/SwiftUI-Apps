//
//  InsetFactView.swift
//  Africa
//
//  Created by Faiq on 06/09/2021.
//

import SwiftUI

struct InsetFactView: View {
    //MARK:- PROPERTIES
    let animal: Animal
    
    //MARK:- BODY
    var body: some View {
        Group {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            } //: TABS
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        } //: BOX
    }
}

//MARK:- PREVIEW
struct InsetFactView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
