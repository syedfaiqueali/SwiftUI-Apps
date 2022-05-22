//
//  RestaurantDetailView.swift
//  SwiftUINavigationList
//
//  Created by Faiq on 27/03/2022.
//

import SwiftUI

struct RestaurantDetailView: View {
    @Environment(\.presentationMode) var mode
    
    var restaurant: Restaurant
    
    var body: some View {
        VStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            
            Spacer()
        }
        
        //Custom NavBackBarButton
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.mode.wrappedValue.dismiss()
        }) {
            Text("\(Image(systemName: "chevron.left")) \(restaurant.name)")
                .foregroundColor(.red)
        })
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: Restaurant(name: "Homei", image: "homei"))
    }
}
