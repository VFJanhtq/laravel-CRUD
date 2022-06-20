//
//  Forms.swift
//  FirstContact
//
//  Created by anhtq on R 4/06/02.
//

import SwiftUI

struct FormField: View {
    var fieldName = ""
    @Binding var fieldValue: String
    var isSecure = false
    var isField = false
    var body: some View {
        VStack {
            if isField{
                if isSecure {
                    SecureField(fieldName, text: $fieldValue)
                        .frame(width: 400,height: 24)
                        .overlay(
                            RoundedRectangle(cornerSize: CGSize(width: 1.0, height: 1.0))
                                .stroke(GrayColor, lineWidth: 0.7)
                                .padding(-8.0)
                        )
                } else {
                    TextField(fieldName, text: $fieldValue)
                        .frame(width: 400,height: 24)
                        .overlay(
                            RoundedRectangle(cornerSize: CGSize(width: 1.0, height: 1.0))
                                .stroke(GrayColor, lineWidth: 0.7)
                                .padding(-8.0)
                        )
                }
            } else {
                if isSecure {
                    SecureField(fieldName, text: $fieldValue)
                        .frame(height: 39)
                        .overlay(
                            RoundedRectangle(cornerSize: CGSize(width: 1.0, height: 1.0))
                                .stroke(GrayColor, lineWidth: 0.5)
                                .padding(-6.0)
                        )
                } else {
                    TextField(fieldName, text: $fieldValue)
                        .frame(height: 39)
                        .overlay(
                            RoundedRectangle(cornerSize: CGSize(width: 1.0, height: 1.0))
                                .stroke(GrayColor, lineWidth: 0.5)
                                .padding(-6.0)
                        )
                }
            }
        } }
}

struct Content: View {
    var type: String
    var boldType = false
    var body: some View{
        VStack {
            boldType == true ?
            Text(type).font(.system(size: 16)).bold().foregroundColor(BlackType):
            Text(type).font(.system(size: 14)).foregroundColor(BlackType)
            
        }
    }
}

struct FormButton: View{
    var buttonLabel = ""
    var isPinkColor = false
    var isSelect: String
    var body: some View {
        if isSelect == "long"{
            if isPinkColor{
                Text(buttonLabel)
                    .font(.headline)
                    .foregroundColor(WhiteColor)
                    .frame(width: 416, height: 48)
                    .background(
                        RoundedRectangle(cornerRadius: 24)
                            .fill(PinkColor)
                    )
                    .shadow(color: ShadowPinkColor
                        .opacity(0.2), radius: 10.0, x: 10.0, y: 10.0)
            }else {
                Text(buttonLabel)
                    .font(.headline)
                    .foregroundColor(BlackColor)
                    .frame(width: 416, height: 46)
                    .background(
                        RoundedRectangle(cornerRadius: 24)
                            .fill(.white)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(BlackColor, lineWidth: 1)
                    ).shadow(color: ShadowGrayColor
                        .opacity(0.3), radius: 10.0, x: 10.0, y: 10.0)
            }
        }else if isSelect == "short" {
            if isPinkColor{
                Text(buttonLabel)
                    .font(.headline)
                    .foregroundColor(WhiteColor)
                    .frame(maxWidth: 315, maxHeight: 48)
                    .background(
                        RoundedRectangle(cornerRadius: 24)
                            .fill(PinkColor)
                    )
                    .shadow(color: ShadowPinkColor
                        .opacity(0.2), radius: 10.0, x: 10.0, y: 10.0)
            }else {
                Text(buttonLabel)
                    .font(.headline)
                    .foregroundColor(BlackColor)
                    .frame(maxWidth: 315, maxHeight: 48)
                    .background(
                        RoundedRectangle(cornerRadius: 24)
                            .fill(.white)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 23)
                            .stroke(BlackColor, lineWidth: 1)
                    ).shadow(color: ShadowGrayColor
                        .opacity(0.3), radius: 10.0, x: 10.0, y: 10.0)
            }
        }else if isSelect == "non"{
            Text(buttonLabel)
                .font(.headline)
                .foregroundColor(WhiteColor)
                .frame(maxWidth: 315, maxHeight: 48)
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .fill(GrayColor)
                )
        }
        
    }
}

struct LabelledDivider: View {
    
    let label: String
    let horizontalPadding: CGFloat
    let color: Color
    
    init(label: String, horizontalPadding: CGFloat = 10, color: Color = .black) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }
    var body: some View {
        HStack {
            line
            Text(label).foregroundColor(color)
                .frame(width: 230,alignment: .center)
            line
        }
    }
    
    var line: some View {
        VStack { Divider().background(color) }.padding(horizontalPadding)
            .frame(width:100)
    }
}
//func textBox(textIn: String) -> AnyView {
//    AnyView(Text("\(textIn)")
//        .font(.headline)
//        .foregroundColor(.white)
//        .frame(minWidth: 200, maxWidth: 416, minHeight: 40, maxHeight: 48)
//        .background(
//            RoundedRectangle(cornerRadius: 20)
//                .fill(Color(red: 0.88, green: 0.38, blue: 0.88))
//        )
//            .shadow(color: Color(red: 1.00, green: 0.00, blue: 0.89)
//            .opacity(0.2), radius: 10.0, x: 10.0, y: 10.0)
//    )
//}

func validate(value: String) -> Bool {
            let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
            let result = phoneTest.evaluate(with: value)
            return result
}
