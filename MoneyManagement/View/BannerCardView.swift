//
//  BannerCardView.swift
//  MoneyManagement
//
//  Created by LeeHsss on 2022/02/08.
//

import SwiftUI

struct BannerCardView: View {
    var banner: AssetBanner
    
    var body: some View {
        Color(banner.backgroundColor)
            .overlay( // ZStack으로 구현해도 동일
                VStack {
                    Text(banner.title)
                        .font(.title)
                    Text(banner.descirption)
                        .font(.subheadline)
                }
            )
    }
}

struct BannerCardView_Previews: PreviewProvider {
    static var previews: some View {
        let banner0 = AssetBanner(title: "공지사항", descirption: "추가된 공지사항을 확인하세요", backgroundColor: .red)
        BannerCardView(banner: banner0)
    }
}
