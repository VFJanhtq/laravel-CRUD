//
//  TestView.swift
//  FirstContact
//
//  Created by anhtq on R 4/06/02.
//

import SwiftUI

struct TestView: View {
    @State var selection: Int? = nil
    @State var aa = ""
    var body: some View {
        let navigation  = NavigationLink(destination: UsageRulesView()) {
        }
        NavigationView {
            ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(0..<100) {
                            Text("Row \($0)")
                        }
                    }
                }
            
        }.navigationViewStyle(StackNavigationViewStyle())
        Form{
            Section {
                            TextField("aa", text: $aa)
                        } header: {
                            Text("Header Text")
                        } footer: {
                            Text("ログインIDが間違っています。")
                                .foregroundColor(.red)
                        }
            VStack {
                        navigation
                        Text("Tap").onTapGesture { self.selection = 1 }
                Text("aaaaaa")
                    }
            Text("aa")
                .font(.system(size: CGFloat(14)))
                .underline()
                .background(
                NavigationLink(destination: UsageRulesView()) {
                    Text("利用規則について")
                }
                
            )
            NavigationLink(destination: UsageRulesView()) {
                Text("利用規則について")
                    .font(.system(size: CGFloat(14)))
                    .underline()
            }
            .padding()
        }
                    
    }

}
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
            .previewInterfaceOrientation(.portrait)
    }
}

//struct SettingView: View {
//    struct SettingTitle: Hashable, Identifiable {
//        var id = UUID()
//        var title : String
//    }
//
//    struct Setting: Identifiable {
//        var id = UUID()
//        var header: String
//        var settingTitles: [SettingTitle]
//    }
//
//    var settings: [Setting] = [
//        Setting(header: "ブックマーク",
//                settingTitles: [SettingTitle(title: "編集")]),
//        Setting(header: "その他",
//                settingTitles: [SettingTitle(title: "プライバシーポリシー"),
//                                SettingTitle(title: "ライセンス"),
//                                SettingTitle(title: "バージョン")])
//    ]
//
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .leading) {
//                List {
//                    ForEach(settings) { setting in
//                        Section(header: Text(setting.header)) {
//                            ForEach(setting.settingTitles) { titles in
//                                NavigationLink(
//                                    destination: SampleView(text: titles.title),
//                                    label: {
//                                        Text(titles.title)
//                                    })
//                            }
//                        }
//                    }
//                }
//                .listStyle(InsetGroupedListStyle())
//                .navigationTitle("設定")
//            }
//        }
//    }
//}
