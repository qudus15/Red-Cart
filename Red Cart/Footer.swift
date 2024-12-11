//
//  Footer.swift
//  Red Cart
//
//  Created by Red Whale inc. on 02/12/2024.
//

import SwiftUI

struct Footer: View {
    
    private var goToUserProfile: Bool = false
    var iconWidth: CGFloat = 20
    var iconHeight: CGFloat = 20
    var footerColor: Color = Color("primaryGray")
    
    var body: some View {
        VStack {
            Divider()
            HStack{
                
                Button(action: {}){
                    NavigationLink(destination: UserProfile()) {
                        Image(systemName: "person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(footerColor)
                            .frame(maxWidth: iconWidth, maxHeight: iconHeight)
                            .padding(.vertical, 1)
                    }
                    .navigationBarHidden(true)
                }
                Spacer()
                TaskBarIcons(taskBarImage: "rectangle.3.group.fill", performAction: home)
                Spacer()
                Button(action: {}){
                    NavigationLink(destination: HomePage()) {
                        Image(systemName: "house.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(Color("primaryRed"))
                            .frame(maxWidth: 30, maxHeight: 30)
                            .padding(.vertical, 1)
                    }
                    .navigationBarHidden(true)
                }
                Spacer()
                TaskBarIcons(taskBarImage: "basket.fill", performAction: home)
                Spacer()
                TaskBarIcons(taskBarImage: "line.3.horizontal", performAction: home)
                
            }
            .padding(.horizontal, 30)
            .padding(.top)
            .background(.thinMaterial)
        }
        .frame(maxWidth: .infinity)
        .ignoresSafeArea(edges: .bottom)
    }
    func home(){
        print("Home is great.")
    }
}

struct TaskBarIcons: View {
    
    var taskBarImage: String = ""
    var iconWidth: CGFloat = 20
    var iconHeight: CGFloat = 20
    var performAction: () -> Void
    var body: some View {
            Button(action: {}) {
                Image(systemName: taskBarImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(Color("primaryGray"))
                    .frame(maxWidth: iconWidth, maxHeight: iconHeight)
                    .padding(.vertical, 1)
            }
    }
}

#Preview {
    Footer()
}
