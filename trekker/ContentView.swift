//
//  ContentView.swift
//  trekker
//
//  Created by David OH on 07/03/2023.
//


import SwiftUI

//import SwiftUI

import Foundation





struct Location : Decodable, Identifiable {
    let id: Int
    let name: String
    let country: String
    let description: String
    let more: String
    let latitude: Double
    let longitude: Double
    let heroPicture: String
    let advisory : String
    
    static let example = Location(id: 1, name: "Great smokey mountains", country: "United states", description: "A great place to visit", more: "more text here", latitude: 35.47338, longitude: 98.345, heroPicture: "smokies", advisory: "Beware of the bears")
    
}


class Locations: ObservableObject {
    let places: [Location]
    
    var primary : Location{
        places[0]
    }
    
    init(){
        let url = Bundle.main.url(forResource: "locations", withExtension: "json")!
        let data = try! Data(contentsOf: url)
       places = try! JSONDecoder().decode([Location].self, from: data)
    }
}


@main
struct trekkerApp: App {
    
    @StateObject var locations = Locations()
    var body: some Scene {
        WindowGroup {
            TabView{
                NavigationView{
                    ContentView(location: locations.primary)
                }.tabItem{
                    Image(systemName: "airplane.circle.fill")
                    Text("Discover")
                    
                }
                NavigationView{
                    world_view()
                }.tabItem{
                    Image(systemName: "star.fill")
                    Text("Locations")
                    
                    
                }
                
                NavigationView{
                    TipsView()
                }.tabItem{
                    Image(systemName: "list.bullet")
                    Text("Tips")
                    
                    
                }
            }.environmentObject(locations)
            }
        }
    }











struct ContentView: View {
    let location: Location
    
    var body: some View {
        
        ScrollView{
            Image(location.heroPicture)
                .resizable()
                .scaledToFit()
            Text(location.name)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            Text(location.country)
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(location.description)
                .font(.title)
                .padding(.horizontal)
            
            Text("Did you know")
                .font(.title3)
                .bold()
                .padding(.top)

            Text(location.more)
                .font(.title)
                .padding(.horizontal)
                 
        }.navigationTitle("Discover")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(location: Locations().primary)
    }
}
 
