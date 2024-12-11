//
//  Header.swift
//  Red Cart
//
//  Created by Red Whale inc. on 09/12/2024.
//

import SwiftUI

struct ProfileHeader: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading){
                VStack(alignment: .leading, spacing: 5){
                    
                    Text("Hello, Qudus")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.white)
                    Text("Your Account")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(.white)
                }
                
                HStack{
                    Spacer()
                    HStack{
                        Text("Browse")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                        Image(systemName: "line.3.horizontal")
                            .bold()
                            .foregroundStyle(.white)
                    }
                }
            }
            .padding()
        }
        .background(Color("primaryRed"))
    }
}

#Preview {
    ProfileHeader()
}
