//
//  AudioBoxesList.swift
//  DunamicLinks
//
//  Created by Roman Zhukov on 22.04.2022.
//

import SwiftUI

struct AudioBoxesList: View {
    @EnvironmentObject var deepLinker: DeepLinkManager
    @State private var selectedBox: Int?
    private let audioBoxes = [AudioBox(id: "01", name: "First box"),
                              AudioBox(id: "02", name: "Second box"),
                              AudioBox(id: "03", name: "Third box")]
    
    var body: some View {
        List(audioBoxes) { audioBox in
            NavigationLink(audioBox.name, tag: audioBox.id, selection: $deepLinker.currentDetail) {
                AudioBoxDetailView(audioBox: audioBox)
            }
        }
        .navigationTitle("AudioBoxes")
        .onAppear {
            print(deepLinker.currentDetail ?? "")
            guard let deepLink = deepLinker.deepLink else { return }
            if let index = audioBoxes.firstIndex(where: { $0.id == deepLink }) {
                deepLinker.currentDetail = audioBoxes[index].id
            }
//            deepLinker.deepLink = nil
            
        }
    }
}

//struct AudioBoxesList_Previews: PreviewProvider {
//    static var previews: some View {
//        AudioBoxesList(tag: "")
//    }
//}

struct AudioBox: Identifiable {
    let id: String
    let name: String
}
