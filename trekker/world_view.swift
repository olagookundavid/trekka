//
//  world_view.swift
//  trekker
//
//  Created by David OH on 07/03/2023.
//

import SwiftUI
import MapKit

struct world_view: View {
    @EnvironmentObject var locations: Locations
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.50722, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40))
    
    var body: some View {
        Map(coordinateRegion: $region,annotationItems: locations.places){
            location in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)){
                NavigationLink(destination: ContentView(location: location)){
                    Image(location.country)
                        .resizable()
                        .cornerRadius(10)
                        .shadow(radius: 3)
                }
            }
        }.navigationTitle("Locations")
    }
}

struct world_view_Previews: PreviewProvider {
    static var previews: some View {
        world_view()
    }
}
