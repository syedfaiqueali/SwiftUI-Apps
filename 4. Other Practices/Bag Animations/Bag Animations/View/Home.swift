//
//  Home.swift
//  Bag Animations
//
//  Created by Faiq on 29/12/2021.
//

import SwiftUI

struct Home: View {
    
    @StateObject var homeData = HomeViewModel()
    
    //Moving image to top like hero animation
    @Namespace var animation
    
    var body: some View {
        ZStack(alignment: .bottom) {
            //: HOME VIEW
            VStack(spacing: 15) {
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "rectangle.3.offgrid.fill")
                            .font(.title2)
                            .foregroundColor(.black)
                    })
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "bag.fill")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.purple)
                            .clipShape(Circle())
                    })
                } //:HSTACK
                .padding()
                .overlay(
                    Text("Nike")
                        .font(.title)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                )
                
                ScrollView {
                    //:SHOE CARDS
                    VStack(alignment: .leading, spacing: 10, content: {
                        Text("Air Max Exosense 'Atomic Powder' ")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        
                        Text("Nike")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Image("shoe")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal,30)
                        
                        Text("Price")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        Text("$270.00")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                        
                    }) //: SCROLL VIEW
                        .padding(.horizontal)
                        .padding(.vertical,20)
                        .background(Color.black.opacity(0.06))
                        .cornerRadius(20)
                        .padding()
                        .overlay(
                            Capsule()
                                .fill(.purple)
                                .frame(width: 4, height: 45)
                                .padding(.top,25)
                                .padding(.leading)
                            ,alignment: .topLeading
                        )
                        .padding()
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                homeData.showCart.toggle()
                            }
                        }
                    
                }
            } //: VSTACK
            
            //: BLURRING WHEN CART IS OPENED
            .blur(radius: homeData.showCart ? 50 : 0)
            
            AddToCart(animation: animation)
            //hiding view when shoe is not selected
                .offset(y: homeData.showCart ? homeData.startAnimation ? 500 : 0 : 500)
            //setting env obj to access it easier
                .environmentObject(homeData)
            
            //Animation
            if homeData.startAnimation {
                VStack {
                    Spacer()
                    ZStack {
                        Image("shoe")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        .matchedGeometryEffect(id: "SHOE", in: animation)
                    }
                    Spacer()
                }
            }
        } //: ZSTACK
        .ignoresSafeArea(.all, edges: .bottom)
        .background(Color.black.opacity(0.04).ignoresSafeArea())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

//MARK: ADD TO CART VIEW
struct AddToCart: View {
    @EnvironmentObject var homeData: HomeViewModel
    var animation: Namespace.ID
    
    let sizes = ["Eu 40", "Eu 41", "Eu 42", "Eu 43", "Eu 44"]
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                if !homeData.startAnimation {
                    Image("shoe")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "SHOE", in: animation)
                }
                
                VStack(alignment: .trailing, spacing: 10, content: {
                    Text("Air Max Exosense 'Atomic Powder' ")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.trailing)
                    
                    Text("$270.00")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                })
            } //:HSTACK
            .padding()
            
            Divider()
            
            Text("SELECT SIZE")
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .font(.caption)
                .padding(.vertical)
            
            //:SIZES
            let columns = Array(repeating: GridItem(.flexible(), spacing: 12),count: 4)
            
            LazyVGrid(columns: columns, alignment: .leading, spacing: 15, content: {
                ForEach(sizes, id: \.self) {size in
                    Button(action: {
                        withAnimation {
                            homeData.selectedSize = size
                        }
                    }, label: {
                        Text(size)
                            .fontWeight(.semibold)
                            .foregroundColor(homeData.selectedSize == size ? Color.white : Color.black)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(homeData.selectedSize == size ? Color.orange : Color.black.opacity(0.06))
                            .cornerRadius(10)
                    })
                }
            })
                .padding(.top)
            
            //:ADD TO CART BUTTON
            Button(action: {
                withAnimation(.easeInOut(duration: 0.7)) {
                    homeData.startAnimation.toggle()
                }
            }, label: {
                Text("Add to cart")
                    .fontWeight(.bold)
                    .foregroundColor(homeData.selectedSize == "" ? .black : .white)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(homeData.selectedSize == "" ? Color.black.opacity(0.06) : .orange)
                    .cornerRadius(18)
                
            })
            //disable button when no size selected
                .disabled(homeData.selectedSize == "")
                .padding(.top)
            
            
        } //:VSTACK
        .padding()
        .background(Color.white.clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 35)))
    }
}


extension View {
    func getRect()-> CGRect {
        return UIScreen.main.bounds
    }
}
