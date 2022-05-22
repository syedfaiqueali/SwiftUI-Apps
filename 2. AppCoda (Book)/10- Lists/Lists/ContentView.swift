//
//  ContentView.swift
//  Lists
//
//  Created by Faiq on 23/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    var restaurants = [ Restaurant(name: "Cafe Deadend", image: "cafedeadend"),
                        Restaurant(name: "Homei", image: "homei"),
                        Restaurant(name: "Teakha", image: "teakha"),
                        Restaurant(name: "Cafe Loisl", image: "cafeloisl"),
                        Restaurant(name: "Petite Oyster", image: "petiteoyster"),
                        Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant"),
                        Restaurant(name: "Po's Atelier", image: "posatelier"),
                        Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
                        Restaurant(name: "Haigh's Chocolate", image: "haighschocolate"),
                        Restaurant(name: "Palomino Espresso", image: "palominoespresso"),
                        Restaurant(name: "Upstate", image: "upstate"),
                        Restaurant(name: "Traif", image: "traif"),
                        Restaurant(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
                        Restaurant(name: "Waffle & Wolf", image: "wafflewolf"),
                        Restaurant(name: "Five Leaves", image: "fiveleaves"),
                        Restaurant(name: "Cafe Lore", image: "cafelore"),
                        Restaurant(name: "Confessional", image: "confessional"),
                        Restaurant(name: "Barrafina", image: "barrafina"),
                        Restaurant(name: "Donostia", image: "donostia"),
                        Restaurant(name: "Royal Oak", image: "royaloak"),
                        Restaurant(name: "CASK Pub and Kitchen", image: "caskpubkitchen")]
    
    var body: some View {
        List(restaurants.indices) { index in
            if (0...1).contains(index) {
                FullImageRow(restaurant:self.restaurants[index])
            } else {
                BaseImageRow(restaurant: self.restaurants[index])
            }
        }
        .listStyle(.plain)
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}

//MARK: Base Image Row
struct BaseImageRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
        }
    }
}

struct FullImageRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        ZStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay(
                    Rectangle()
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .opacity(0.2)
                )
            
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
        }
    }
}
