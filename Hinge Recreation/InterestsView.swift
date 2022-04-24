//
//  InterestsView.swift
//  Hinge Recreation
//
//  Created by Ethan Rayala on 4/24/22.
//

import Foundation
import SwiftUI

struct InterestsView: View {
    
    @State var items: [listItem] = [
        listItem(name: "Men"),
        listItem(name: "Women"),
        listItem(name: "Non-binary people"),
        listItem(name: "Everyone")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Select all who you're open to meeting")
                .foregroundColor(.gray)
                .font(.caption)
                .fontWeight(.semibold)
                .padding(.leading)
            Spacer()
            List{
                ForEach(0..<items.count){ index in
                        HStack {
                                Button(action: {
                                        items[index].isSelected = items[index].isSelected ? false : true
                                }) {
                                        HStack{
                                                if items[index].isSelected {
                                                        Image(systemName: "checkmark.circle.fill")
                                                                .foregroundColor(.green)
                                                                .animation(.easeIn)
                                                } else {
                                                        Image(systemName: "circle")
                                                                .foregroundColor(.primary)
                                                                .animation(.easeInOut)
                                                }
                                                Text(items[index].name)
                                        }
                                }.buttonStyle(BorderlessButtonStyle())
                        }
                }
            }
        }
        .navigationTitle("I'm Interested In")
    }
    
}

struct listItem{
        var id = UUID()
        var name: String
        var isSelected: Bool = false
}

struct InterestsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InterestsView()
        }
    }
}
