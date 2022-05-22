//
//  ContentView.swift
//  Touchdown
//
//  Created by Faiq on 23/09/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK:- PROPERTIES
    @EnvironmentObject var shop: Shop
    
    // MARK:- BODY
    var body: some View {
        ZStack {
            if shop.showingProduct == false && shop.selectedProduct == nil {
                VStack(spacing: 0) {
                    NavigationBarView()
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                    
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(spacing: 0) {
                            //1
                            FeaturedTabView()
                                .padding(.vertical, 20)
                            
                            //2
                            CategoryGridView()
                            
                            //3
                            TitleView(title: "Helmets")
                            LazyVGrid(columns: gridLayout, spacing: 15, content: {
                                ForEach(products) {product in
                                    ProductItemView(product: product)
                                        .onTapGesture {
                                            feedback.impactOccurred() //haptics
                                            withAnimation(.easeOut) {
                                                shop.selectedProduct = product
                                                shop.showingProduct = true
                                            }   
                                        }
                                } //: LOOP
                            }) //: GRID
                            .padding(15)
                            
                            //4
                            TitleView(title: "Brands")
                            BrandGridView()
                        
                            //5
                            FooterView()
                                .padding(.horizontal)
                        } //: VSTACK
                    }) //: SCROLL VIEW
                    
                } //: VSTACK
                .background(colorBackground.ignoresSafeArea(.all, edges: .all))
            } else {
                ProductDetailView()
            }
        } //: ZSTACK
        .ignoresSafeArea(.all, edges: .top)
    }
}

// MARK:- PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro")
            .environmentObject(Shop())
    }
}
