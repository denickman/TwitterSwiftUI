//
//  Constants.swift
//  TwitterSwiftUI
//
//  Created by Denis Yaremenko on 5/13/21.
//

import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")
