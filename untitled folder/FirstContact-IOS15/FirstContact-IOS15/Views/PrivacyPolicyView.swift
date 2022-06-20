//
//  PrivacyPolicyView.swift
//  IPad_Dental
//
//  Created by anhtq on 2022/04/28.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
//                NavigationView{
//                    PrivacyPolicyModel(url: URL(string: "https://vitalify.jp/about/#about_6"))
//                        .navigationBarHidden(true)
//                        .edgesIgnoringSafeArea(.all)
//                }.navigationViewStyle(StackNavigationViewStyle())
        VStack {
            // Navar
            VStack {
                NavName(label: "プライバシーポリシー")
                    .frame(maxWidth:.infinity, alignment: .top)
                    .offset(x: 0, y: -35)
            }
            ZStack{
                HStack{
                    VStack {
                        HStack{
                            Content(type: "個人情報保護方針について", boldType: true).padding(.bottom)
                            Spacer()
                        }
                        Content(type: "株式会社バイタリフィ(以下｢当社｣)は、お客様の個人情報を適切に保護することを当社の重要な社会的責務として考え、個人情報の取扱いについて当社の方針を示すことと致します。 \n\n1. 当社では、お客様との取引やサービスを提供するためにお客様の個人情報を適法に収集し、その範囲内で収集した個人情報を利用致します。 \n\n2. 収集したお客様の個人情報は、原則としてお客様の承諾を得ない第三者または取引先 (当社の業務委託先への預託を除く) 等に対して提供・開示は致しません。 \n\n3. お客様の個人情報は、紛失・破壊・改ざん・漏洩・不正アクセス等が生じないようにセキュリティ対策を講じて適正に管理致します。 \n\n4. 個人情報保護法などの法令・ガイドラインを遵守して、お客様の個人情報を取扱ってまいります。 \n\n5. 当社は、お客様との取引やサービスを提供するために個人情報に関する取扱いを外部に委託することがありますが、その場合には、適正な取扱いを確保するため、契約の締結、当社の個人情報保護の方針の周知徹底、実施状況の点検などを行ってまいります。 \n\n6. お客様がご自身の個人情報について内容の照会、訂正、削除、利用の停止を求められる場合には、当社窓口までご連絡お願い致します。 \n\n7. 当社は、お客様の個人情報の取扱いが適正に行われるよう従事者への教育を実施し、当該適正な取扱いにつき定期的に点検するとともに、個人情報保護の取り組みを必要に応じて随時見直し、改善してまいります。 \n\n8. 当社の個人情報の取扱いに関するお問合せは下記までご連絡お願い致します。 \n\n以上 2006年3月20日 株式会社バイタリフィ代表取締役 \n\n川勝潤治").padding(.bottom)
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

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
