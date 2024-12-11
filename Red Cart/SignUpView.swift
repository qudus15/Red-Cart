//
//  SignUpView.swift
//  Red Cart
//
//  Created by Red Whale inc. on 02/12/2024.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var firstLastName = ""
    @State private var emailAddress = ""
    @State private var userPassword = ""
    @State private var confirmUserPassword = ""
    @State private var mobileNumber = ""
    @State private var isPasswordVisible: Bool = false
    @State private var errorMessage: String = ""
    
    var body: some View {
        ZStack {
            VStack{
                
                VStack{
                    VStack(alignment: .leading, spacing: 10){
                        Text("First and last name")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(Color("gray"))
                        TextField("", text: $firstLastName)
                            .padding()
                            .frame(height: 40)
                            .background(Color.white)
                            .cornerRadius(2)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(Color("primaryRed"), lineWidth: 0.5)
                            )
                        
                        Text("Email address")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(Color("gray"))
                        TextField("", text: $emailAddress)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .padding()
                            .frame(height: 40)
                            .background(Color.white)
                            .cornerRadius(0.2)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(Color("primaryRed"), lineWidth: 0.5)
                            )
                        
                        Text("Mobile number")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(Color("gray"))
                        TextField("", text: $mobileNumber)
                            .keyboardType(.phonePad)
                            .padding()
                            .frame(height: 40)
                            .background(Color.white)
                            .cornerRadius(0.2)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(Color("primaryRed"), lineWidth: 0.5)
                            )
                        
                        Text("Create a password")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(Color("gray"))
                        PasswordView(userPassword: $userPassword, isPasswordVisible: $isPasswordVisible)
                        
                        Text("Confirm password")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(Color("gray"))
                        ConfirmPasswordView(confirmUserPassword: $confirmUserPassword, isPasswordVisible: $isPasswordVisible)
                        
                        ContinueButtonView()
                        
                    }
                    
                }
                .padding(22)
                .cornerRadius(0.5)
                .overlay(
                    RoundedRectangle(cornerRadius: 0.5)
                        .stroke(Color("gray"), lineWidth: 0.09)
                )
                Spacer()
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .bottom) {
            HStack {
                Text("Registration")
                    .foregroundColor(.white)
                    .font(.system(size: 19, weight: .semibold, design: .rounded))
            }
            .padding(50)
            .frame(maxWidth: .infinity)
            .background(Color("primaryRed"))
        }
    }
}

#Preview {
    SignUpView()
}
