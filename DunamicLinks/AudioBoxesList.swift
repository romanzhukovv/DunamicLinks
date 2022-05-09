//
//  AudioBoxesList.swift
//  DunamicLinks
//
//  Created by Roman Zhukov on 22.04.2022.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct AudioBoxesList: View {
    @EnvironmentObject var deepLinker: DeepLinkManager
    
//    private let audioBoxes = [AudioBox(id: "01", name: "First box"),
//                              AudioBox(id: "02", name: "Second box"),
//                              AudioBox(id: "03", name: "Third box")]
    
    private var audioBoxes: [AudioBox] = []
    
//    init() {
//        let db = Firestore.firestore()
//        let id =
//        db.collection("audioBoxes").document().getDocuments { querySnapshot, error in
//            if let error = error {
//                print(error)
//            } else {
//                for document in querySnapshot!.documents {
////                self.audioBoxes = querySnapshot?.documents.compactMap({ $0.data(as: AudioBox.self)
////                }) as! [AudioBox]
//                   let audioBox = try? document.data(as: AudioBox.self)
////                    self.audioBoxes.append(audioBox ?? AudioBox(id: "", name: ""))
////                    }
//                }
//            }
//        }
//    }
    
    var body: some View {
        List(audioBoxes) { audioBox in
            NavigationLink(audioBox.name, tag: audioBox.id!, selection: $deepLinker.currentDetail) {
                AudioBoxDetailView(audioBox: audioBox)
            }
        }
        .navigationTitle("AudioBoxes")
        .onAppear {
            guard let deepLink = deepLinker.deepLink else { return }
            if let index = audioBoxes.firstIndex(where: { $0.id == deepLink }) {
                deepLinker.currentDetail = audioBoxes[index].id
            }
        }
    }
}

//struct AudioBoxesList_Previews: PreviewProvider {
//    static var previews: some View {
//        AudioBoxesList(tag: "")
//    }
//}

struct AudioBox: Identifiable, Codable {
    @DocumentID var id: String?
    let name: String
}
