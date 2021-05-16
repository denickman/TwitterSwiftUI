//
//  User.swift
//  TwitterSwiftUI
//
//  Created by Denis Yaremenko on 5/13/21.
//

import Firebase

struct User: Identifiable {
    let id: String // need to confrom Identifiable protocol
    let username: String
    let email: String
    let profileImageUrl: String
    let fullName: String
    
    var isCurrentUser: Bool {
        return Auth.auth().currentUser?.uid == self.id
    }
    
    init(dictionary: [String : Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.fullName = dictionary["fullname"] as? String ?? ""
    }
}
