//
//  ContentView.swift
//  DunamicLinks
//
//  Created by Roman Zhukov on 21.04.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var deepLinker: DeepLinkManager
    @State private var tag: String? = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("Main View")
                    .padding(.top, 100)
                Spacer()
                NavigationLink("Открыть аудиотеку", tag: ViewType.audioList, selection: $deepLinker.currentView) {
                    AudioBoxesList()
                }
            }
            .navigationTitle("Shagame")
        }
        .navigationViewStyle(.stack)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
