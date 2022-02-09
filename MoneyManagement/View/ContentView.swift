//
//  ContentView.swift
//  MoneyManagement
//
//  Created by LeeHsss on 2022/02/07.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .asset
    
    enum Tab {
        case asset
        case recommend
        case alert
        case setting
    }
    
    var body: some View {
        TabView(selection: $selection) {
            AssetView().tabItem {
                Image(systemName: "dollarsign.circle.fill")
                Text("자산")
            }
            .tag(Tab.asset)
            
            Text("Hello")
                .customTextStyle()
                .tabItem {
                Image(systemName: "hand.thumbsup.fill")
                Text("추천")
            }
            .tag(Tab.recommend)
            
            //MARK: Yellow View에 대한 탭 아이템을 설정
            Color.yellow.edgesIgnoringSafeArea(.top).tabItem {
                Image(systemName: "bell.fill")
                Text("알림")
            }
            .tag(Tab.alert)
            
            //MARK: 탭뷰 생성
            Color.red.edgesIgnoringSafeArea(.top).tabItem {
                Image(systemName: "gearshape.fill")
                Text("설정")
            }
            .tag(Tab.setting)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func customTextStyle() -> some View {
        modifier(CustomTextModifier())
    }
}
