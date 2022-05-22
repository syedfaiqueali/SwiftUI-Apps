//
//  CustomListCellView.swift
//  Calculator
//
//  Created by Faiq on 12/10/2021.
//

import SwiftUI

struct CustomListCellView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            // MARK:- Image
            Image("Dish")
                .resizable()
                .cornerRadius(10)
                .frame(width: 80, height: 80)
                .scaledToFill()
                .shadow(radius: 1)
            
            // MARK:- Description
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Ridan house of Mandi")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(Color.black)
                    
                    Spacer()
                    
                    Text("PREMIUM")
                        .font(.system(size: 12))
                        .foregroundColor(Color.red)
                }
                Text("This is a description of the dish. This dish is very delicious. This dish is very delicious.")
                    .font(.footnote)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                
                HStack {
                    Text("20%")
                        .font(.system(size: 15))
                        .bold()
                        .foregroundColor(Color.red)
                    
                    Spacer()
                    
                    Text("Valid till: 20/02/2021")
                        .font(.system(size: 12))
                        .foregroundColor(Color.black)
                        .bold()
                }
                HStack {
                    Image(systemName: "cart.fill")
                    Text("Halal")
                        .font(.system(size: 12))
                        .foregroundColor(Color.black)
                        .bold()
                }
            }
        }
    }
}

struct CustomListCellView_Previews: PreviewProvider {
    static var previews: some View {
        CustomListCellView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
