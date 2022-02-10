//
//  AssetSectionView.swift
//  MoneyManagement
//
//  Created by LeeHsss on 2022/02/09.
//

import SwiftUI

struct AssetSectionView: View {
    
    // 관찰하는
    @ObservedObject var assetSection: Asset
    
    var body: some View {
        VStack(spacing: 20) {
            AssetSectionHeaderView(title: assetSection.type.title)
            ForEach(assetSection.data) { asset in
                HStack {
                    Text(asset.title)
                        .font(.title)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(asset.amount)
                        .font(.title2)
                        .foregroundColor(.primary)
                }
                
                Divider()
            }
        }
        .padding()
    }
}

struct AssetSectionView_Previews: PreviewProvider {
    static var previews: some View {
        let asset = Asset(id: 0, type: .bankAccount, data: [
            AssetData(id: 0, title: "신한은행", amount: "5,300,235원"),
            AssetData(id: 1, title: "국민은행", amount: "900,235원"),
            AssetData(id: 0, title: "카카오뱅크", amount: "1,000,000원")
        ])
        AssetSectionView(assetSection: asset)
    }
}
