//
//  LoginView.swift
//  IPad_Dental
//
//  Created by anhtq on 2022/04/27.
//

import SwiftUI
struct LoginView: View {
    @State var isChecked = false
    @State var selection : Int? = nil
    @StateObject private var loginVM = LoginViewModel()
    @EnvironmentObject var authentication: Authentication
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Background()
                    VStack() {
                        //Login Form
                        VStack(alignment: .center) {
                            FirstContactImage()
                            ZStack{
                                VStack {
                                    // User
                                    VStack(alignment: .leading) {
                                        FormField(fieldName: "ログイン", fieldValue: $loginVM.credentials.username, isField: true).autocapitalization(.none)
                                            .disableAutocorrection(true)
                                        AuthError(isError: false,TextError: "ログインIDが間違っています。")
                                    }.padding()
                                    //isHidden
                                   
                                    if loginVM.isError {
                                        Text("hi")
                                    }
                                    //Password
                                    VStack(alignment: .leading) {
                                        FormField(fieldName: "パスワード", fieldValue: $loginVM.credentials.password, isSecure: true, isField: true).autocapitalization(.none)
                                        AuthError(isError: false,TextError: "パスワードが間違っています。")
                                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0))                                   // CheckBox
                                    HStack {
                                        CheckBoxButton(isChecked: $isChecked)
                                        Text("ログイン状態を保持する")
                                    }.padding([.trailing],200)
                                        .padding([.bottom])
                                    Button(action: {
                                        loginVM.login { accessToken in
                                            authentication.updateValidation(accessToken: accessToken)
                                        }
                                    }){
                                        FormButton(buttonLabel: "ログイン", isPinkColor: true, isSelect: "long")
                                    }
                                }.alert(item: $loginVM.error) { error in
                                    Alert(title: Text("Invlid Login"), message: Text(error.localizedDescription))
                                }
                            }.padding()
                            // End Login Form
                            ZStack{
                                MenuButton()
                            }.padding()
                        }
                        .frame(width: 514, height: 661)
                        .background(Color.white.opacity(0.82))
                        Spacer().frame(height: 54)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                Spacer()
                
            }
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
}





struct Background: View {
    var body: some View {
        Image("Background")
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}

struct CheckBoxButton: View {
    // 切り替える状態（初期値はfalse）
    @Binding var isChecked: Bool
    // チェックボックスの表示
    var body: some View {
        Image(systemName: isChecked ? "checkmark.square" : "square")
            .foregroundColor(isChecked ? Color(UIColor.systemBlue) : Color.secondary)
            .onTapGesture {
                self.isChecked.toggle()
            }
        
    }
}

struct FirstContactImage: View {
    var body: some View {
        Image(decorative: "Logo1")
            .resizable()
            .frame(width: 211, height: 113)
            .font(.system(size: 12, weight: .semibold))
            .padding()
    }
}


// Menu
struct MenuButton: View {
    let sizeFont = 14
    var body: some View {
        VStack {
            LabelledDivider(label: "初めてのご利用はこちらから").padding(.bottom)
            NavigationLink(destination: RegistrationView().navigationBarBackButtonHidden(true)) {
                FormButton(buttonLabel: "新規会員登録", isSelect: "long")
            }
            HStack {
                NavigationLink(destination: UsageRulesView()) {
                    Text("利用規則について")
                        .font(.system(size: CGFloat(sizeFont)))
                        .underline()
                }
                .padding()
                NavigationLink(destination: PrivacyPolicyView()) {
                    Text("プライバシーポリシー")
                        .font(.system(size: CGFloat(sizeFont)))
                        .underline()
                }.padding()
                NavigationLink(destination: LicenseView()) {
                    Text("ライセンス")
                        .font(.system(size: CGFloat(sizeFont)))
                        .underline()
                }.padding()
                
                
            }
        }
    }
}






struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
                .previewInterfaceOrientation(.landscapeRight)
        }
    }
}
