//
//  ContentView.swift
//  DunamicLinks
//
//  Created by Roman Zhukov on 21.04.2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.deepLink) var deepLink
    @State private var tag: String? = ""
    @State private var audioBoxID: String? = ""
    var body: some View {
        NavigationView {
            VStack {
                Text("Main View")
                    .padding(.top, 100)
                Spacer()
                NavigationLink("Открыть аудиотеку", tag: "receivedLink", selection: $tag) {
                    AudioBoxesList(audioBoxID: audioBoxID)
                }
            }
            .navigationTitle("Shagame")
        }
        .navigationViewStyle(.stack)
        .onChange(of: deepLink) { _ in
            tag = "receivedLink"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
