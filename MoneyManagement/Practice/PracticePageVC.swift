//
//  PracticePageVC.swift
//  MoneyManagement
//
//  Created by LeeHsss on 2022/02/09.
//

import SwiftUI
import UIKit

struct PracticePageVC: UIViewControllerRepresentable {
    
    @Binding var currentPage: Int // 현재 보여질 페이지
    var pages: [BannerCardView] // PageViewController의 DataSource로 사용될 데이터 집합
    
    //MARK: UIViewControllerRepresentable의 필수 구현 함수들
    
    //MARK: UIKit의 UIPageViewController를 SwiftUI에서 사용하기 위한 처리 ViewController 생성
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageVC.delegate = context.coordinator
        pageVC.dataSource = context.coordinator
        return pageVC
    }
    
    //MARK: ViewController의 업데이트 사항이 발생할때 업데이트 처리
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        //MARK: controllers의 currentPage에 해당하는 ViewController를 첫 화면에 표시, currentPage가 바뀔때마다 바뀐 페이지가 자동 표시
        uiViewController.setViewControllers([context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}


extension PracticePageVC {
    
    class Coordinator: NSObject, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
        var parent: PracticePageVC
        var controllers = [UIViewController]()
        
        init(_ vc: PracticePageVC) {
            self.parent = vc
            controllers = parent.pages.map {
                UIHostingController(rootView: $0)
            }
        }
        
        //MARK: UIPageViewControllerDelegate, UIPageViewControllerDataSource 구현 함수들
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            // 필수구현
            guard let index = controllers.firstIndex(of: viewController) else { return nil }
            if index == 0 {
                return controllers.last
            }
            
            return controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            // 필수구현
            guard let index = controllers.firstIndex(of: viewController) else { return nil }
            
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            
            if completed,
               let visibleVC = pageViewController.viewControllers?.first, //Line 25. setViewControllers에서 cuurentPage에 해당하는 뷰컨 하나만 추가함
               let index = controllers.firstIndex(of: visibleVC) { // 보여지고 있는 뷰컨의 인덱스를 구함
                parent.currentPage = index // currentPage를 갱신해줌
            }
        }
    }
}
