//
//  UserProfile.swift
//  Red Cart
//
//  Created by Red Whale inc. on 02/12/2024.
//

import SwiftUI

struct UserProfile : View {
    
    @State private var listR1 : [String] = ["Lists", "Recommendations", "Browsing History", "Subscribe & Save", "Recalls and Product Safety Alerts", "Your Red Membership", "Your Membership & Subscriptions"]
    
    @State private var listR2 : [String] = ["Track and manage your orders", "Buy Again", "Return Are Easy", "Shipping Rates & Policies"]
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing: 10){
                VStack(alignment: .leading){
                    Text("Your Account")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                    
                    List{
                        ForEach(listR1, id: \.self) { rowList in
                            Text(rowList)
                                .font(.system(size: 17))
                                .listRowInsets(EdgeInsets(top: 0, leading: 3, bottom: 0.1, trailing: 0))
                        }
                    }
                    .listStyle(InsetListStyle())
                }
                .frame(height: 350)
                
                VStack(alignment: .leading){
                    Text("Your Orders")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                    
                    List{
                        ForEach(listR2, id: \.self) { listItems2 in
                            Text(listItems2)
                                .font(.system(size: 17))
                                .listRowInsets(EdgeInsets(top: 0, leading: 3, bottom: 0.1, trailing: 0))
                        }
                    }
                    .listStyle(InsetListStyle())
                }
                
                HStack(spacing: 10){
                    
                    HStack{
                        Image(systemName: "globe")
                            .foregroundStyle(Color("gray"))
                        Text("English")
                            .font(.system(size: 17, weight: .regular, design: .rounded))
                            .foregroundStyle(Color("gray"))
                    }
                    
                    Spacer()
                    
                    HStack{
                        Image("canada")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 18, maxHeight: 18)
                        Text("Canada")
                            .font(.system(size: 17, weight: .regular, design: .rounded))
                            .foregroundStyle(Color("gray"))
                    }
                }
            }
            .padding(.horizontal)
            .navigationBarHidden(true)
           
        }
        .safeAreaInset(edge: .bottom) {
            Footer()
        }
        .safeAreaInset(edge: .top) {
            ProfileHeader()
        }
    }
}

#Preview {
    UserProfile()
}
