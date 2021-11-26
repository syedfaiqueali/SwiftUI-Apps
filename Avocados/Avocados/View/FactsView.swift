//
//  FactsView.swift
//  Avocados
//
//  Created by Faiq on 26/11/2021.
//

import SwiftUI

struct FactsView: View {
    //MARK: PROPERTIES
    var fact: Fact
    
    //MARK: BODY
    var body: some View {
        ZStack {
            Text(fact.content)
                .padding(.leading, 55)
                .padding(.trailing,10)
                .padding(.vertical, 3)
                .frame(width: 300, height: 135, alignment: .center)
                .background(LinearGradient(gradient: Gradient(colors: [Color("ColorGreenMedium"), Color("ColorGreenLight")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(12)
                .lineLimit(6)
                .multilineTextAlignment(.leading)
                .font(.footnote)
            .foregroundColor(Color.white)
            
            Image(fact.image)
                .resizable()
                .frame(width: 60, height: 60, alignment: .center)
                .clipShape(Circle())
                .background(
                    Circle()
                        .fill(Color.white)
                        .frame(width: 74, height: 74, alignment: .center)
                )
                .background(
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("ColorGreenMedium"), Color("ColorGreenLight")]), startPoint: .trailing, endPoint: .leading))
                        .frame(width: 82, height: 82, alignment: .center)
                )
                .background(
                    Circle()
                        .fill(Color("ColorAppearanceAdaptive"))
                        .frame(width: 90, height: 90, alignment: .center)
                )
                .offset(x: -150)
        } //: ZSTACK
    }
}

struct FactsView_Previews: PreviewProvider {
    static var previews: some View {
        FactsView(fact: factsData[0])
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
