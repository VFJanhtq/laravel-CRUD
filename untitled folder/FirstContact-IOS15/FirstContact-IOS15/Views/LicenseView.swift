//
//  LicenseView.swift
//  FirstContact
//
//  Created by anhtq on R 4/05/19.
//

import SwiftUI
import Foundation
struct LicenseView: View {
    var body: some View {
//                NavigationView{
//                    PrivacyPolicyModel(url: URL(string: "https://vitalify.jp/about/#about_6"))
//                        .navigationBarHidden(true)
//                        .edgesIgnoringSafeArea(.all)
//                }.navigationViewStyle(StackNavigationViewStyle())
  
        
        VStack {
            // Navar
            VStack {
                NavName(label: "ライセンス")
                    .frame(maxWidth:.infinity, alignment: .top)
                    .offset(x: 0, y: -35)
            }
            ZStack{
                HStack{
                    VStack {
                        HStack{
                            Content(type: "MIT 　License", boldType: true).padding(.bottom)
                            Spacer()
                        }
                        Content(type: "MIT Licence Copyright (c) 2013-2021,\n\n ZipArchive, https://github.com/ZipArchive\n\n Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the“Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n\n The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\n\n THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.").padding(.bottom)
                    }
                }
                .frame(maxWidth: 668, maxHeight: .infinity)
                .onAppear {
                    UITableView.appearance().backgroundColor = .white
                }
                //close form
            }.offset(x: 0, y: -50)

        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(WhiteColor.opacity(0.82))
    }
}

struct LicenseView_Previews: PreviewProvider {
    static var previews: some View {
        LicenseView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
