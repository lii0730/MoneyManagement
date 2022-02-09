//
//  AssetBannerView.swift
//  MoneyManagement
//
//  Created by LeeHsss on 2022/02/08.
//

import SwiftUI

struct AssetBannerView: View {
    var AssetBannerList: [AssetBanner] = [
        AssetBanner(title: "공지사항", descirption: "추가된 공지사항을 확인하세요", backgroundColor: .red),
        AssetBanner(title: "주말 이벤트", descirption: "주말 이벤트 놓치지 마세요", backgroundColor: .yellow),
        AssetBanner(title: "깜짝 이벤트", descirption: "엄청난 이벤트에 놀라지 마세요", backgroundColor: .blue),
        AssetBanner(title: "가을 프로모션", descirption: "가을...😃", backgroundColor: .brown)
    ]
    
    @State private var currentPage = 0
    
    var body: some View {
        let bannerCards = AssetBannerList.map {
            BannerCardView(banner: $0)
        }
        
        ZStack(alignment: .bottomTrailing) {
//            PageViewController(pages: bannerCards, currentPage: $currentPage)
//            PageControl(numberOfPages: bannerCards.count, currentPage: $currentPage)
//                .frame(width: CGFloat(bannerCards.count * 18))
//                .padding(.trailing)
            
            PracticePageVC(currentPage: $currentPage, pages: bannerCards)
            PracticePageControl(numberOfPages: bannerCards.count, currentPage: $currentPage)
                .frame(width: CGFloat(bannerCards.count * 18))
                .padding(.trailing)
        }
    }
}

struct AssetBannerView_Previews: PreviewProvider {
    static var previews: some View {
        AssetBannerView()
            .aspectRatio(5/2, contentMode: .fit)
    }
}
