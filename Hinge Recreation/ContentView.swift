//
//  ContentView.swift
//  Hinge Recreation
//
//  Created by Ethan Rayala on 4/11/22.
//

import SwiftUI

let gray = UIColor(red: 240, green: 240, blue: 240)


struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(gray)
                    .ignoresSafeArea()
                ScrollView {
                    HStack {
                        Spacer()
                        
                        Image(systemName: "arrow.uturn.backward")
                            .font(.title2)
                        
                        NavigationLink(destination: PreferencesView(), label: {
                            Image(systemName: "slider.horizontal.3")
                                .font(.title2)
                                .foregroundColor(.black)
                                .padding([.leading, .trailing])
                        })
                        
                    }
                    Name(name: "Raheel", pronouns: "he/him/his")
                    Picture(picName: "raheel 1")
                    TextBox(prompt: "Don't hate me if I", answer: "am too cute")
                    CompleteProfile(age: "19", height: "5' 8", sexuality: "Straight", location: "Chapel Hill", school: "UNC Chapel Hill", religion: "Muslim", home: "Cary, NC")
                        .padding(.top)
                    Picture(picName: "raheel 2")
                    TextBox(prompt: "I won't shut up about", answer: "myself being so cute")
                    Picture(picName: "raheel 5")
                    Picture(picName: "raheel 4")
                    TextBox(prompt: "I'll fall for you if", answer: "you are cute like me")
                }
                Image(systemName: "x.circle")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .position(x: 50, y: 700)
            }
            .navigationBarHidden(true)
        }
    }
}

struct CompleteProfile: View {
    
    var age: String
    var height: String
    var sexuality: String
    var location: String
    var school: String
    var religion: String
    var home: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: 355, height: 200)
                .cornerRadius(12)
            VStack {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ProfileHScroll(symbol: "person.text.rectangle", input: age)
                            .font(.title)
                        Text("|")
                            .font(.title)
                        ProfileHScroll(symbol: "ruler", input: height)
                            .font(.title)
                        Text("|")
                            .font(.title)
                        ProfileHScroll(symbol: "person.fill.questionmark", input: sexuality)
                            .font(.title)
                        Text("|")
                            .font(.title)
                        ProfileHScroll(symbol: "mappin.circle", input: location)
                    }
                    .padding([.leading],20)
                }
                .padding(.top, 5)
                
                Divider()
                Spacer()
                
                Profile(symbol: "graduationcap", input: school)
                Profile(symbol: "book", input: religion)
                Profile(symbol: "house.fill", input: home)
                
                
            }
           
            Rectangle()
                .fill(Color(gray))
                .frame(width: 35, height: 200)
                .cornerRadius(12)
                .position(x: 0, y: 80)
            Rectangle()
                .fill(Color(gray))
                .frame(width: 35, height: 200)
                .cornerRadius(12)
                .position(x: 390, y: 80)
        }
    }
}

struct Profile: View {
    
    var symbol: String
    var input: String
    
    var body: some View {
        HStack {
            Image(systemName: symbol)
                .padding(.leading, 22)
            
            Text(input)
                .padding(.trailing, 22)
            Spacer()
        }
        Divider()
        Spacer()
    }
}

struct ProfileHScroll: View {
    
    var symbol: String
    var input: String
    
    var body: some View {
        Image(systemName: symbol)
            .font(.title3)
        Text(input)
            .font(.title3)
    }
}

struct TextBox: View {
    var prompt: String
    var answer: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: 355, height: 200)
                .cornerRadius(12)
            Text(prompt)
                .font(.title3)
                .fontWeight(.bold)
                .position(x: 190, y: 30)
            Text(answer)
                .font(.title2)
                .position(x: 190, y: 100)
            LikeButton(yCoord: 160)
        }
    }
}

struct Name: View {
    
    var name: String
    var pronouns: String
    
    var body: some View {
        HStack {
            VStack {
                Text(name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading)
                Text(pronouns)
                    .font(.body)
                
            }
            Spacer()
            
            Image(systemName: "ellipsis")
                .font(.title2)
                .padding()
        }
    }
}

struct Picture: View {
    
    
    var picName: String
    
    var body: some View {
        ZStack {
            Image(picName)
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
                .padding()
            LikeButton(yCoord: 330)
        }
    }
}

struct LikeButton: View {
    
    @State private var isLiked: Bool = false
    var yCoord: CGFloat
    
    var body: some View {
        Button(action: {
            withAnimation{
                isLiked.toggle()
            }
        }, label: {
            Image(systemName: "heart.circle")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(isLiked ? Color.red : Color(gray))
                .position(x: 330, y: yCoord)
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
