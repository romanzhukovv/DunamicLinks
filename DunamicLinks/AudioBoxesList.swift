//
//  AudioBoxesList.swift
//  DunamicLinks
//
//  Created by Roman Zhukov on 22.04.2022.
//

import SwiftUI

struct AudioBoxesList: View {
    @Environment(\.deepLink) var deepLink
    @State private var selectedBox: Int?
    @State var audioBoxID: String? = ""
    private let audioBoxes = [AudioBox(id: "01", name: "First box"),
                              AudioBox(id: "02", name: "Second box"),
                              AudioBox(id: "03", name: "Third box")]
    
    var body: some View {
        List(audioBoxes.indices) { index in
            NavigationLink(audioBoxes[index].name, tag: index, selection: $selectedBox) {
                AudioBoxDetailView(audioBox: audioBoxes[index])
            }
        }
        .navigationTitle("AudioBoxes")
        
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
