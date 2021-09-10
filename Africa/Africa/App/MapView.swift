//
//  MapView.swift
//  Africa
//
//  Created by Faiq on 05/09/2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK:- PROPERTIES
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    //MARK:- BODY
    var body: some View {
        // NO #01 - BASIC MAP
        //Map(coordinateRegion: $region)
        
        // NO #02 - MAP WITH ANNOTATIONS
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: {item in
            //(A) PIN: OLD STYLE (always static)
            //MapPin(coordinate: item.location, tint: .accentColor)
            
            //(B) MARKER: NEW STYLE (always static)
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            //(c) CUSTOM BASIC ANNOTATION: (interative)
            MapAnnotation(coordinate: item.location) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32, alignment: .center)
            } //: ANNOTATION
        })
    }
}

//MARK:- PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
