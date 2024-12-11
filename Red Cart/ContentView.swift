//
//  ContentView.swift
//  Red Cart
//
//  Created by Red Whale inc. on 16/11/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isActive = false
    @State private var scaleEffect = 1.0
    
    var body: some View {
        if isActive {
            MainView()
        } else {
            SplashScreenView()
                .scaleEffect(scaleEffect)
                .onAppear {
                    // Animate the splash screen
                    withAnimation(.easeInOut(duration: 1.5)) {
                        scaleEffect = 1.2
                    }
                    // Delay to transition to the main screen
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        isActive = true
                    }
                }
        }
    }
}

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
            }
        }
    }
}
//Main View
struct MainView : View {
    
    @State private var emailAddress: String = ""
    @State private var userPassword: String = ""
    @State private var errorMessage: String = ""
    @State var goToProfile: Bool = false
    
    var body: some View {
        NavigationView{
            
            if goToProfile {
                HomePage()
            } else {
                ZStack{
                    Image("bagBg")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                    
                    
                    VStack(spacing: 10){
                        
                        HStack{
                            Text("Hi, Dear!")
                            Image(systemName: "person.wave.2.fill")
                                .foregroundColor(Color("primaryRed"))
                        }
                        .navigationTitle("")
                        .navigationBarTitleDisplayMode(.inline)
                        .foregroundColor(.black)
                        
                        
                        Spacer()
                        HStack{
                            NavigationLink(destination: SignInView(emailAddress: $emailAddress, userPassword: $userPassword, errorMessage: $errorMessage, goToProfile: $goToProfile), label: {Text("Sign in")})
                                .foregroundColor(Color("primaryRed"))
                                
                            
                            Divider()
                                .frame(maxHeight: 50)
                            
                            Text("BLACK FRIDAY")
                                .foregroundColor(.white)
                                .bold()
                                .frame(width: 140, height: 30)
                                .background(Color.black)
                                .cornerRadius(5)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color(.black), lineWidth: 3)
                                }
                            
                            Divider()
                                .frame(maxHeight: 50)
                            
                            NavigationLink(destination: SignUpView(), label: {Text("Sign up")})
                                .foregroundColor(Color("primaryRed"))
                        }
                        
                    }
                }
            }
        }
        .accentColor(Color.red)
    }
}

//User sign in page
struct SignInView: View {
    
    @Binding var emailAddress: String
    @Binding var userPassword: String
    @Binding var errorMessage: String
    @Binding var goToProfile: Bool
    @State private var isChecked = false
    
    var body: some View {
        
        ZStack {
            VStack{
                VStack(alignment: .leading, spacing: 10){
                    Text("Mobile number or email")
                        .font(.system(size: 17, weight: .regular, design: .rounded))
                        .foregroundColor(Color("gray"))
                    TextField("Mobile number or email", text: $emailAddress)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .foregroundColor(.black)
                        .padding()
                        .frame(height: 50)
                        .background(Color.white)
                        .cornerRadius(0.2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(Color("gray"), lineWidth: 0.5)
                        )
                    
                    Text("Password")
                        .font(.system(size: 17, weight: .regular, design: .rounded))
                        .foregroundColor(Color("gray"))
                    SecureField("Password", text: $userPassword)
                        .foregroundColor(.black)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .frame(height: 50)
                        .background(Color.white)
                        .cornerRadius(2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(Color("gray"), lineWidth: 0.5)
                        )
                    
                    Toggle("Remember login", isOn: $isChecked)
                        .toggleStyle(CheckboxToggleStyle())
                        .font(.system(size: 16, design: .rounded))
                        .foregroundColor(Color("gray"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.bottom, .top])
                    
                    HStack{
                        Button(action: {loginSubmit()}) {
                            Text("Continue")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .background(Color("gray"))
                                .clipShape(RoundedRectangle(cornerRadius: 2))
                        }
                        .padding([.top, .bottom])
                        
                        Button(action: {loginSubmit()}){
                            
                            Image(systemName: "faceid")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .fontWeight(.regular)
                                .frame(maxWidth: 25, maxHeight: 25)
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: 50, maxHeight: 50)
                        .background(Color("primaryRed"))
                    }
                    
                    
                }
                
                Button(action: {}){
                    Text("Forgot Password?")
                        .foregroundColor(Color("gray"))
                }
                .padding([.top], 20)
                
                Spacer()
                
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
            }
            .padding([.top], 30)
            
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Welcome")
                    .foregroundColor(.white)
                    .font(.headline)
            }
        }
        .safeAreaInset(edge: .top) {
            HStack {
                
            }
            .padding(20)
            .frame(maxWidth: .infinity)
            .background(Color("primaryRed"))
        }
    }
    
    func loginSubmit() {
        if emailAddress.isEmpty || userPassword.isEmpty {
            errorMessage = "Fields can not be empty."
        } else if emailAddress == "red@red.com" && userPassword == "red" {
            errorMessage = ""
            goToProfile = true
        } else {
            errorMessage = "Invalid email address and password."
        }
    }
}

struct PasswordView : View {
    
    @Binding var userPassword : String
    @Binding var isPasswordVisible : Bool
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                if isPasswordVisible {
                    TextField("", text: $userPassword)
                        .textContentType(.password)
                } else {
                    SecureField("", text: $userPassword)
                        .textContentType(.password)
                }
                
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                        .font(.system(size: 13))
                }
            }
            .padding()
            .frame(height: 40)
            .background(Color.white)
            .cornerRadius(2)
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color("primaryRed"), lineWidth: 0.5)
            )
        }
    }
}

struct ConfirmPasswordView : View {
    
    @Binding var confirmUserPassword : String
    @Binding var isPasswordVisible : Bool
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                
                if isPasswordVisible {
                    TextField("", text: $confirmUserPassword)
                        .textContentType(.password)
                        .foregroundColor(.black)
                } else {
                    SecureField("", text: $confirmUserPassword)
                        .textContentType(.password)
                        .foregroundColor(.black)
                }
                
                
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                        .font(.system(size: 13))
                }
            }
        }
        .padding()
        .frame(height: 40)
        .background(Color.white)
        .cornerRadius(2)
        .overlay(
            RoundedRectangle(cornerRadius: 2)
                .stroke(Color("primaryRed"), lineWidth: 0.5)
        )
    }
}

//Login Button
struct LoginButtonView : View {
    
    var body: some View {
        
        Button(action: {}) {
            Text("SIGN IN")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color("gray"))
                .clipShape(RoundedRectangle(cornerRadius: 2))
        }
    } 
}

struct ContinueButtonView : View {
    
    var body: some View {
        
        Button(action: {}) {
            Text("Continue")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color("gray"))
                .clipShape(RoundedRectangle(cornerRadius: 2))
        }
        .padding([.top, .bottom])
    }
}


//Face ID View
struct FaceIdView : View {
    var body: some View {
        Button(action: {}){
            
            Image(systemName: "faceid")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .fontWeight(.regular)
                .frame(maxWidth: 25, maxHeight: 25)
                .foregroundColor(.white)
        }
        .frame(maxWidth: 50, maxHeight: 50)
        .background(Color("primaryRed"))
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(configuration.isOn ? .red : .gray)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            
            configuration.label
        }
    }
}

#Preview {
    ContentView()
}
