//
//  CardView.swift
//  DeveloperApp
//
//  Created by Aviral on 29/04/21.
//

import SwiftUI

struct CardView: View {
    //MARK: - properties
    let developer: Card
    @State private var fadeIn: Bool = false
    @State private var movetext: Bool = false
    @State private var showAlert: Bool = false
    
    
    //MARK: - body
    var body: some View {
        ZStack {
            Image(developer.imageName)
                .resizable()
                .opacity(fadeIn ? 1.0 : 0.0)
            VStack(alignment: .center){
                Text(developer.title)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                Text(developer.headline)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .top)
            .offset(y: fadeIn ? 0 : -220)
            .padding()
            
            VStack {
                Button(action: {
                    print("Button tapped")
                    playSound(sound: "sound-chime", type: "mp3")
                    showAlert = true
                }, label: {
                    HStack {
                        Text(developer.callToAction.uppercased())
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        Image(systemName: "arrow.right.circle")
                            .foregroundColor(Color.white)
                            .font(.largeTitle)
                    }
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: developer.gradientColors), startPoint: .leading, endPoint: .trailing))
                    .clipShape(Capsule())
                    .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
                })
            }.frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .bottom)
            .offset(y: fadeIn ? 0 : 220)
            .padding()
        }
        .background(LinearGradient(gradient: Gradient(colors: developer.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .padding()
        .shadow(radius: 8)
        .onAppear() {
            withAnimation(.linear(duration:1.12)){
                self.fadeIn = true
            }
            withAnimation(.linear(duration: 0.6)){
                self.movetext = true
            }
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text(developer.title), message: Text(developer.message), dismissButton: .default(Text("OK")))
        })
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(developer: dataDevelopers[1])
    }
}
