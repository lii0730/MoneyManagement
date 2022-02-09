//
//  PracticePageControl.swift
//  MoneyManagement
//
//  Created by LeeHsss on 2022/02/09.
//

import SwiftUI

struct PracticePageControl: UIViewRepresentable {
    var numberOfPages: Int // PageControl의 개수 설정
    @Binding var currentPage: Int // 현재 보여지는 Page
    
    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = numberOfPages
        //MARK: PageControl의 값이 변할때마다 changedPageControl을 호출함
        pageControl.addTarget(context.coordinator, action: #selector(Coordinator.changedPageControl), for: .valueChanged)
        return pageControl
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var control: PracticePageControl
        
        init(_ control: PracticePageControl) {
            self.control = control
        }
        
        @objc func changedPageControl(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
