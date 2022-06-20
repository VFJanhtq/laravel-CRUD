//
//  RegisterSuccessView.swift
//  FirstContact
//
//  Created by anhtq on R 4/05/31.
//

import SwiftUI

struct RegisterSuccessView: View {
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Background()
                    
                    VStack() {
                        
                        VStack(alignment: .center) {
                           
                            VStack {
                                VStack {
                                    Text("送信完了")
                                        .font(.system(size: 25))
                                        .foregroundColor(BlueColor)
                                }.padding()
                                VStack {
                                    Text("ご登録いただいたメールアドレス宛てに登録確認用のご案内を送りしましたので")
                                        .font(.system(size: 16))
                                        .padding(.bottom,1)
                                    Text("メールの内容を確認して、アカウントの登録確認を完了してください。")
                                        .font(.system(size: 16))
                                }.padding()
                                FormButton(buttonLabel: "閉じる", isPinkColor: true, isSelect: "long")
                            }
                        }
                        .frame(width: 668, height: 299)
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

struct RegisterSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterSuccessView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
