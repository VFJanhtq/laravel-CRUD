//
//  LoginFailedView.swift
//  IPad_Dental
//
//  Created by anhtq on 2022/04/28.
//

import SwiftUI
struct RegistrationView: View {
    @State private var value = ""
    @EnvironmentObject var accountCreation : AccountCreationViewModel
    @State var isChecked = false
    @State var isActive = false
    @State private var action: Int? = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        // Form Input
        
        VStack {
            // Navar
            VStack {
                NavName(label: "新規会員登録")
                    .frame(maxWidth:.infinity, alignment: .top)
                    .offset(x: 0, y: -35)
            }
            ZStack{
                // View
                VStack {
                    ScrollView{
                        Group{
                            VStack(alignment: .leading){
                                SessionHeader(label: "ログインID", required: true).padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 0))
                                SectionName()
                            }.padding()
                            VStack(alignment: .leading){
                                SessionHeader(label: "メールアドレス", Englishization: true, required: true)
                                TextButton(value: "", buttonText: "例)　info@vitalify.jp")
                            }.padding()
                            VStack(alignment: .leading){
                                SessionHeader(label: "ログインID", required: true)
                                TextButton(value: "", buttonText: "例)　First Contact Bot")
                            }.padding()
                            VStack(alignment: .leading){
                                SessionHeader(label: "パスワード", required: true)
                                TextButton(value: "", buttonText: "例)　Vitalify")
                            }.padding()
                            VStack(alignment: .leading){
                                SessionHeader(label: "会社名", required: true)
                                TextButton(value: "", buttonText: "例)")
                            }.padding()
                            VStack(alignment: .leading){
                                SessionHeader(label: "電話番号", required: true)
                                TextButton(value: "", buttonText: "例)")
                            }.padding()
                        }
                        Group{
                            VStack{
                                HStack {
                                    CheckBoxButton(isChecked: $isChecked)
                                    NavigationLink(destination: PrivacyPolicyView()) {
                                        Text("プライバシーポリシー")
                                            .font(.system(size: CGFloat(14)))
                                            .underline()
                                    }
                                    Text("に同意する。")
                                    Spacer()
                                }.padding(.leading,10)
                            }
                        }
                        VStack() {
                            
                        }.padding([.bottom], 140)
                        }.frame(maxWidth: 668, maxHeight: .infinity)
                        .onAppear {
                            UITableView.appearance().backgroundColor = .white
                    }
                }.padding([.bottom], -50)
                    
                // End View
                VStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            FormButton(buttonLabel: "戻る",isSelect: "short").padding()
                            if isChecked{
                                FormButton(buttonLabel: "入力内容を確認する",isPinkColor: true,isSelect: "short").padding()
                            }else{
                                FormButton(buttonLabel: "入力内容を確認する",isSelect: "non").padding()
                            }

                        }.padding()
                            .opacity(1.0)

                    }.frame(maxHeight: .infinity, alignment: .bottom)
                        .offset(x: 0, y: 50)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }.offset(x: 0, y: -50)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(WhiteColor.opacity(0.82))
    }
}

//
struct NavName: View {
    let label: String
    let horizontalPadding: CGFloat
    
    init(label: String, horizontalPadding: CGFloat = 10) {
        self.label = label
        self.horizontalPadding = horizontalPadding
    }
    var body: some View {
        VStack {
            Text(label).foregroundColor(BlueColor).font(.system(size: 17)).bold()
                .frame(alignment: .center)
            line
        }
    }
    var line: some View {
        VStack { Divider().background(GrayColor) }.padding(horizontalPadding)
            .frame(maxWidth: .infinity)
    }
}


//
struct TextButton: View {
    @State var value = ""
    @State var buttonText = ""
    var body: some View {
        TextField(buttonText, text: $value)
            .frame(width: 654, height: 39, alignment: .center)
            .overlay(
                RoundedRectangle(cornerSize: CGSize(width: 0.0, height: 0.0))
                    .stroke(Color.gray, lineWidth: 0.5)
                    .padding(EdgeInsets(top: 0, leading: -7, bottom: 0, trailing: -7))
            )
    }
}

// SessionHeader
struct SessionHeader: View {
    var label: String
    var Englishization = false
    var required = false
    var body: some View {
        HStack {
            Text(label).font(.headline).foregroundColor(.black)
            if !required == false {
                requiredRectangle
            }
            if !Englishization == false {
                Text("*半角英数字")
            }
        }.frame(alignment: .leading)
            .padding([.bottom], 10)
            .padding(.leading, -10)
    }
    var requiredRectangle: some View {
        VStack { Rectangle()
                .fill(RedColor).overlay(
                    Text("必須").foregroundColor(WhiteColor).font(.subheadline)
                ).frame(width: 54, height: 22)
        }
    }
}

struct AuthError: View {
    @State var isError: Bool
    var TextError = ""
    var body: some View {
        HStack {
            if !isError == false {
                Text(TextError).font(.system(size: 13))
                    .foregroundColor(RedColor)
            }
        }.frame(alignment: .leading)
            .padding(.top, 6)
            .padding(.leading, -10)
    }
}

//View
struct LoginFailedView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

//
struct PathButton: View {
    @State var isActive = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                FormButton(buttonLabel: "戻る",isSelect: "short").padding()
                FormButton(buttonLabel: "入力内容を確認する",isPinkColor: true,isSelect: "short").padding()
            }.padding()
                .opacity(1.0)
            
        }.frame(maxHeight: .infinity, alignment: .bottom)
    }
}

//
struct SectionName: View {
    @State private var value = ""
    var body: some View {
        VStack{
            HStack {
                HStack {
                    Text("姓").font(.headline).padding(.trailing,13)
                    TextField("例)　山田)", text: $value)
                        .frame(width: 290, height: 39)
                        .overlay(
                            RoundedRectangle(cornerSize: CGSize(width: 0.0, height: 0.0))
                                .stroke(Color.gray, lineWidth: 0.5)
                                .padding(EdgeInsets(top: 0, leading: -7, bottom: 0, trailing: 0))
                        )
                }.frame(width: 341)
                    .padding(EdgeInsets(top: 0, leading: -7, bottom: 0, trailing: 0))
                HStack{
                    Text("名").font(.headline).padding(.trailing,10)
                    TextField("  例)　太郎", text: $value)
                        .frame(width: 290, height: 39)
                        .overlay(
                            RoundedRectangle(cornerSize: CGSize(width: 0.0, height: 0.0))
                                .stroke(Color.gray, lineWidth: 0.5)
                                .padding(EdgeInsets(top: 0, leading: -7, bottom: 0, trailing: 0))
                        )
                }.frame(width: 327)
                
            }
        }
    }
}
