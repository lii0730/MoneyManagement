//
//  AssetCardSectionView.swift
//  MoneyManagement
//
//  Created by LeeHsss on 2022/02/10.
//

import SwiftUI

struct AssetCardSectionView: View {
    @State private var selectedTab = 1
    @ObservedObject var asset: Asset
    
    var assetData: [AssetData] {
        return self.asset.data
    }
    
    var body: some View {
        VStack {
            AssetSectionHeaderView(title: asset.type.title)
            TabMenuView(tabs: ["지난달 결제", "이번달 결제", "다음달 결제"], selectedTab: $selectedTab, updated: .constant(.nextMonth(amount: "10,000원")))
            TabView(selection: $selectedTab) {
                VStack {
                    ForEach(assetData) { data in
                        HStack {
                            Text(data.title)
                                .font(.title)
                                .foregroundColor(.secondary)
                            Spacer()
                            Text(data.creditCardAmounts![selectedTab].amount)
                                .font(.title)
                                .foregroundColor(.primary)
                        }
                        Divider()
                    }
                }
                .tag(selectedTab)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .padding()
            
        }
    }
}

struct AssetCardSectionView_Previews: PreviewProvider {
    static var previews: some View {
//        let asset = AssetSummaryView().assets[5]
        AssetCardSectionView(asset:
                                Asset(
                                    id: 0,
                                    type: .creditCard,
                                    data: [
                                        AssetData(
                                            id: 0,
                                            title: "현대카드",
                                            amount: "0원",
                                            creditCardAmounts: [
                                                .nextMonth(amount: "다음 달"),
                                                .currentMonth(amount: "이번 달"),
                                                .previousMonth(amount: "이전 달")
                                            ]
                                        )
                                    ]
                                )
        )
    }
}
