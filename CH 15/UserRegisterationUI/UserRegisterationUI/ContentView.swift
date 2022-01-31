//
//  ContentView.swift
//  UserRegisterationUI
//
//  Created by Ahmed Amin on 29/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var userRegistrationViewModel = UserRegistrationViewModel()
    
    var body: some View {
        VStack {
            Text("Create an account")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .padding(.bottom, 30)
                        
            FormField(fieldName: "Username", fieldValue: $userRegistrationViewModel.username, isSecured: false)
            RequirementText(nameIcoon: "xmark.square", iconColor: userRegistrationViewModel.isUsernameLengthValid ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255), requirmentText: "A minimum of 4 characters", isStrike: userRegistrationViewModel.isUsernameLengthValid)
            
                .padding()
            
            FormField(fieldName: "Password", fieldValue: $userRegistrationViewModel.password, isSecured: true)
            VStack {
                
                RequirementText(nameIcoon: "lock.open", iconColor: userRegistrationViewModel.isPasswordLengthValid ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255), requirmentText: "A minimum of 8 characters", isStrike: userRegistrationViewModel.isPasswordLengthValid)
                    .padding(.bottom, 5)
                
                RequirementText(nameIcoon: "lock.open", iconColor: userRegistrationViewModel.isPasswordCapitalLetter ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255), requirmentText: "One uppercase letter", isStrike: userRegistrationViewModel.isPasswordCapitalLetter)
     
            }
            .padding()
            
            FormField(fieldName: "Confirm Password", fieldValue: $userRegistrationViewModel.passwordConfirm, isSecured: true)
            
            RequirementText(nameIcoon: "xmark.square", iconColor: userRegistrationViewModel.isPasswordConfirmValid ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255), requirmentText: "Your confirm password should be the same as password", isStrike: userRegistrationViewModel.isPasswordConfirmValid)
                .padding()
                .padding(.bottom, 50)
            
            
            Button {
                print("SignUP Action")
            } label: {
                Text("SignUp")
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .frame(minWidth: 0,  maxWidth: .infinity, alignment: .center)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 251/255, green: 128/255, blue: 128/255), Color(red: 253/255, green: 193/255, blue: 104/255)]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            HStack {
                Text("Already have an account?")
                    .font(.system(.body, design: .rounded))
                    .bold()
                
                Button {
                    print("SignIn Action")
                } label: {
                    Text("Sign in")
                        .font(.system(.body, design: .rounded))
                        .bold()
                        .foregroundColor(Color(red: 251/255, green: 128/255, blue: 128/255))
                }
            }
            .padding(.top, 50)
            Spacer()
        }
        .padding()
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//MARK: - Form Field
struct FormField: View {
    
    var fieldName: String
    @Binding var fieldValue: String
    var isSecured: Bool = false
    
    var body: some View {
        
        VStack {
            if isSecured {
                SecureField(fieldName, text: $fieldValue)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
                
            } else {
                TextField(fieldName, text: $fieldValue)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            }
            Divider()
                .frame(width: nil, height: 1, alignment: .center)
                .background(Color(red: 240/255, green: 240/255, blue: 240/255))
                .padding(.horizontal)
        }
    }
}

//MARK: - Requirement Text

struct RequirementText: View {
    var nameIcoon: String
    var iconColor: Color = Color(red: 251/255, green: 128/255, blue: 128/255)
    var requirmentText: String
    var isStrike: Bool
    
    var body: some View {
        
        HStack {
            Image(systemName: nameIcoon)
                .foregroundColor(iconColor)
            
            Text(requirmentText)
                .font(.system(.body, design: .rounded))
                .foregroundColor(.secondary)
                .strikethrough(isStrike)
            
            Spacer()
        }
    }
}
