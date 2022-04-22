//
//  AudioBoxDetailView.swift
//  DunamicLinks
//
//  Created by Roman Zhukov on 22.04.2022.
//

import SwiftUI
import Firebase

struct AudioBoxDetailView: View {
    let audioBox: AudioBox

    
    var body: some View {
        VStack {
            Text(audioBox.name)
            Button("Поделиться") {
                createDynamicLink()
            }
            .padding(.top, 50)
        }
        .navigationTitle(audioBox.name)
    }
    
    func createDynamicLink() {
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "www.apple"
        components.path = "/ru/app-store/ru"
        
        let itemIDQueryItem = URLQueryItem(name: "audioBoxID", value: "\(audioBox.id)")
        components.queryItems = [itemIDQueryItem]
        
        guard let linkParameter = components.url else { return }
        print(linkParameter.absoluteString)
        
        let domain = "https://dunamiclinks.page.link"
        guard let linkBuilder = DynamicLinkComponents(link: linkParameter, domainURIPrefix: domain) else { return }
        
        if let myBundleId = Bundle.main.bundleIdentifier {
            linkBuilder.iOSParameters = DynamicLinkIOSParameters(bundleID: myBundleId)
        }
        
        linkBuilder.iOSParameters?.appStoreID = "1202726435"
        
        linkBuilder.socialMetaTagParameters = DynamicLinkSocialMetaTagParameters()
        linkBuilder.socialMetaTagParameters?.title = "\(audioBox.name)"
        linkBuilder.socialMetaTagParameters?.descriptionText = "\(audioBox.name) in the World"
        
        guard let longURL = linkBuilder.url else { return }
        print(longURL.absoluteString)
        
        linkBuilder.shorten { url, warnings, error in
            if let error = error {
                print(error)
                return
            }
            
            if let warnings = warnings {
                for warning in warnings {
                    print(warning)
                }
            }
            
            guard let url = url else { return }
            print(url.absoluteString)
            
            shareAudioBox(url: url)
        }
    }
    
    func shareAudioBox(url: URL) {
        let activityVC = UIActivityViewController(activityItems:[url], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}

struct AudioBoxDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AudioBoxDetailView(audioBox: AudioBox(id: "01", name: "My box"))
    }
}
