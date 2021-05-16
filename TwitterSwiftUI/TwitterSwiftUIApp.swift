//
//  TwitterSwiftUIApp.swift
//  TwitterSwiftUI
//
//  Created by Denis Yaremenko on 5/12/21.
//

import SwiftUI
import Firebase

@main
struct TwitterSwiftUI: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(AuthViewModel())
        }
    }
}
