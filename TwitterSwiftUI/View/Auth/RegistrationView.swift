//
//  RegistrationView.swift
//  TwitterSwiftUI
//
//  Created by Denis Yaremenko on 5/4/21.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var email = ""
    @State var password = ""
    @State var fullName = ""
    @State var userName = ""
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    // this is a variable that keeps track of presentation state
    // when the navigation stack pushes on new screen SwiftUI gives an ability to be able to notify based on this presentation mode environment variable
    
    var body: some View {
        ZStack { // because we need to add / remove placeholder as text changes
            VStack {
                Button(action: { showImagePicker.toggle() }, label: {
                    ZStack {
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                clipped()
                                .cornerRadius(140.0/2) // clipshape circle too
                                .padding(.top, 88)
                                .padding(.bottom, 16)
                                
                        } else {
                            Image("ic_add_photo")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.white)
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .padding(.top, 88)
                                .padding(.bottom, 16)
                        }
                    }
                })
                .sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedUIImage)
                })

                VStack(spacing: 20) {
                    CustomTextField(text: $email,
                                    placeholder: Text("Email"),
                                    imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $fullName,
                                    placeholder: Text("Full Name"),
                                    imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $userName,
                                    placeholder: Text("User Name"),
                                    imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 32)
                
                Button(action: {}, label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(width: 360, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .padding(.top, 10)
                })
                
                Spacer()
                
                Button(action: {
                    mode.wrappedValue.dismiss()
                }, label: {
                    HStack {
                        Text("Already have an account")
                            .font(.system(size: 14))
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                })
                
                // version with environment mode
                /*
                HStack {
                    Text("Already have an account")
                        .font(.system(size: 14))
                    Text("Sign In")
                        .font(.system(size: 14, weight: .semibold))
                }
                .foregroundColor(.white)
                .padding(.bottom, 40)
                .onTapGesture {
                    mode.wrappedValue.dismiss()
                }
                 */
            }
        }
        .background(Color(#colorLiteral(red: 0.003714659251, green: 0.6806516647, blue: 0.9372209311, alpha: 1)))
        .ignoresSafeArea()
    }
    
    
    func loadImage() {
        guard let selected = selectedUIImage else { return }
        image = Image(uiImage: selected)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
