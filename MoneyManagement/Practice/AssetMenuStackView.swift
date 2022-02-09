//
//  AssetMenuStackView.swift
//  MoneyManagement
//
//  Created by LeeHsss on 2022/02/08.
//

import SwiftUI

struct AssetMenuStackView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<20) { index in // 결국 10개짜리 가로 스크롤뷰 20번 반복
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<10) { index in
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .frame(width: 200, height: 200, alignment: .center)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        }
                    }
                }
            }
        }
        
        //MARK: 단일 가로 스크롤 뷰
//        ScrollView(.horizontal) {
//            HStack {
//                ForEach(0..<10) { index in
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(Color.white)
//                        .frame(width: 200, height: 200, alignment: .center)
//                        .shadow(radius: 10)
//                        .padding()
//                }
//            }
//        }
    }
}

struct AssetMenuStackView_Previews: PreviewProvider {
    static var previews: some View {
        AssetMenuStackView()
    }
}
