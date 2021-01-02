//
//  ContracoesApp.swift
//  Contracoes WatchKit Extension
//
//  Created by Paolo on 02/01/21.
//

import SwiftUI

@main
struct ContracoesApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
