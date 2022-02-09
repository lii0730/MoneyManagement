//
//  NavigationBarWithButton.swift
//  MoneyManagement
//
//  Created by LeeHsss on 2022/02/07.
//

import SwiftUI

struct NavigationBarWithButton: ViewModifier {
    var title: String = ""
    func body(content: Content) -> some View {
        return content
            .navigationBarItems(
                leading:
                    Text(title)
                    .font(.system(size: 24, weight: .bold))
                    .padding()
                , trailing:
                    Button(
                        action: {
                            print("자산 추가 버튼 클릭!")
                        }, label: {
                            HStack(spacing: 5) {
                                Image(systemName: "plus")
                                Text("자산 추가")
                                    .font(.system(size: 15))
                            }
                            .padding(6)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black))
                        }
                    )
                    .accentColor(.black)
                    
            )
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.configureWithTransparentBackground()
                appearance.backgroundColor = UIColor(white: 1, alpha: 0.5)
                    
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().compactAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
    }
}

extension View {
    func navigationBarWithButtonStyle(_ title: String) -> some View {
        return self.modifier(NavigationBarWithButton(title: title))
    }
}

struct NavigationBarWithButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Color.gray.edgesIgnoringSafeArea(.all)
                .navigationBarWithButtonStyle("내 자산")
        }
    }
}
