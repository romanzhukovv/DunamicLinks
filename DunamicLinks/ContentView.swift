//
//  ContentView.swift
//  DunamicLinks
//
//  Created by Roman Zhukov on 21.04.2022.
//

import SwiftUI

struct ContentView: View {
    @Binding var deepLink: DeepLinkHandler.DeepLink?
    @State private var tag: String? = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("Main View")
                    .padding(.top, 100)
                Spacer()
                NavigationLink("Открыть аудиотеку", tag: "receivedLink", selection: $tag) {
                    AudioBoxesList(deepLink: $deepLink)
                }
            }
            .navigationTitle("Shagame")
        }
        .navigationViewStyle(.stack)
        .onChange(of: deepLink) { deepLink in
            tag = "receivedLink"
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
