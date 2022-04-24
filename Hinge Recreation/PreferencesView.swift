//
//  PreferencesView.swift
//  Hinge Recreation
//
//  Created by Ethan Rayala on 4/11/22.
//

import Foundation
import SwiftUI

struct Section {
    var id: Int
    var title: String
    var choice: String
}

let basicPreferences = [
    Section(id: 1, title: "My Neighborhood", choice: "Chapel Hill"),
]

let memberPreferences = [
    Section(id: 1, title: "Age Range", choice: "18 - 22"),
    Section(id: 2, title: "Ethnicity", choice: "Open to All"),
    Section(id: 3, title: "Religion", choice: "Open to All"),
]

let preferredPreferences = [
    Section(id: 1, title: "Height", choice: "3' 0 - 7' 0"),
    Section(id: 2, title: "Children", choice: "Open to All"),
    Section(id: 3, title: "Family Plans", choice: "Open to All"),
    Section(id: 4, title: "Education Level", choice: "Open to All"),
    Section(id: 5, title: "Politics", choice: "Open to All"),
    Section(id: 6, title: "Drinking", choice: "Open to All"),
    Section(id: 7, title: "Smoking", choice: "Open to All"),
    Section(id: 8, title: "Marijuana", choice: "Open to All"),
    Section(id: 9, title: "Drugs", choice: "Open to All"),
]

struct PreferencesView: View {
    
    @State public var distance: Double = 1.0
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Header(title: "Basic Preferences")
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("I'm Interested In")
                            .fontWeight(.medium)
                            

                    }
                    .padding(.leading)
                    
                    Spacer()
                    
                    NavigationLink(destination: InterestsView(), label: {
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .padding()
                    })
                }
                
                Divider()
                
                ForEach(basicPreferences, id:\.id) { card in
                    PreferenceComponent(title: card.title, choice: card.choice)
                }
                
                
                Header(title: "Member Preferences")
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Distance")
                            .fontWeight(.medium)
                            
                        Text("\(String(format: "%.0f", distance)) mi")
                            .foregroundColor(.gray)
                    }
                    .padding(.leading)
                    
                    Spacer()
                    
                    NavigationLink(destination: DistanceView(distance: $distance), label: {
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .padding()
                    })
                }
                
                Divider()
                ForEach(memberPreferences, id:\.id) { card in
                    PreferenceComponent(title: card.title, choice: card.choice)
                }
                
                Header(title: "Preferred Preferences")
                ForEach(preferredPreferences, id:\.id) { card in
                    PreferenceComponent(title: card.title, choice: card.choice)
                }
                    
            }
            
        }
        .navigationBarTitle("Dating Preferences")
    }
}

struct PreferenceComponent: View {
    
    var title: String
    var choice: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .fontWeight(.medium)
                    
                Text(choice)
                    .foregroundColor(.gray)
            }
            .padding(.leading)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.caption)
                .padding()
        }
        
        Divider()
    }
}

struct Header: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(.gray)
            .fontWeight(.bold)
            .padding([.leading, .top])
        Divider()
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PreferencesView()
        }
    }
}
