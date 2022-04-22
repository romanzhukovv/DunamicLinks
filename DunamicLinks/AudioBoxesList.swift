//
//  AudioBoxesList.swift
//  DunamicLinks
//
//  Created by Roman Zhukov on 22.04.2022.
//

import SwiftUI

struct AudioBoxesList: View {
    @Binding var deepLink: DeepLinkHandler.DeepLink?
    @State private var selectedBox: Int?
    private let audioBoxes = [AudioBox(id: "01", name: "First box"),
                              AudioBox(id: "02", name: "Second box"),
                              AudioBox(id: "03", name: "Third box")]
    
    var body: some View {
        List(audioBoxes.indices) { index in
            NavigationLink(audioBoxes[index].name, tag: index, selection: $selectedBox) {
                AudioBoxDetailView(audioBox: audioBoxes[index], selectedBox: $selectedBox)
            }
        }
        .navigationTitle("AudioBoxes")
        .onAppear {
            guard let deepLink = deepLink else { return }
            
            switch deepLink {  
            case .home:
                break
            case .details(let audioBoxID):
                if let index = audioBoxes.firstIndex(where: { $0.id == audioBoxID }) {
                    self.deepLink = nil
                    selectedBox = index
                }
            }
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
