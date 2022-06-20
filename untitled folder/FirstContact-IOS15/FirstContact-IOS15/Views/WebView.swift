//
//  WebView.swift
//  IPad_Dental
//
//  Created by anhtq on 2022/04/28.
//

import SwiftUI

struct WebView: View {
    @State var accessToken: String
   
    var body: some View {
        NavigationView{
            LoginModel(accessToken: accessToken, url: URL(string: "https://demo.first-contact.jp/cms/app/api/login"))
                .navigationBarHidden(true)
                .edgesIgnoringSafeArea(.all)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(accessToken: "")
    }
}
