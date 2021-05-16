//
//  AuthViewModel.swift
//  TwitterSwiftUI
//
//  Created by Denis Yaremenko on 5/11/21.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    //MARK: - Properties
    // every time @Published property changes it is gonna reconfigure view with new data
    @Published var userSession: FirebaseAuth.User?
    @Published var isAuthenticating = false
    @Published var error: Error?
    @Published var user: User?
    
    //MARK: - Init
    init() {
        userSession = Auth.auth().currentUser // check if user is logged in or not
        // can return user object or nil if nil - than user is not logged
        fetchUser()
    }
    
    //MARK: - Methods
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (response, error) in
            if let error = error {
                print("DEBJG: Failed to login \(error.localizedDescription)")
                return
            }

            print("DEBUG: Sucess Log In")
            self.userSession = response?.user
        }
    }
    
    func registerUser(email: String, password: String, username: String, fullname: String, profileImage: UIImage? = nil) {
        print("DEBUG: Email is \(email)")
        print("DEBUG: Password is \(password)")
        
        guard let imageData = profileImage?.jpegData(compressionQuality: 0.3) else {
            return
        }
        
        let fileName = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(fileName)
        
        storageRef.putData(imageData, metadata: nil) { (_, error) in
            
            if let error = error {
                print("DEBJG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            print("DEBUG: Successfully uploaded user photo...")
            
            storageRef.downloadURL { (url, error) in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { response, error in
                    
                    if let error = error {
                        print("DEBUG: Error \(error.localizedDescription)")
                        return
                    }
                    
                    guard let user = response?.user else { return }
                    
                    let data = ["email" : email,
                                "username" : username.lowercased(),
                                "fullname" : fullname,
                                "profileImageURL" : profileImageUrl,
                                "uid" : user.uid]

                    Firestore.firestore().collection("users").document(user.uid).setData(data) { (error) in
                        guard let error = error else {
                            print("DEBUG: Successfully uploaded new profile info")
                            self.userSession = user
                            return
                        }
                        
                        print("DEBUG: ERROR \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            guard let data = snapshot?.data() else { return }
            self.user = User(dictionary: data)
            print("DEBUG: User is \(self.user?.username)")
        }
    }
}
