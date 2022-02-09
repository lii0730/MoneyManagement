//
//  PageViewController.swift
//  MoneyManagement
//
//  Created by LeeHsss on 2022/02/08.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    
    var pages: [Page]
    @Binding var currentPage: Int

    //MARK: 필수 구현 함수 3가지
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    //MARK: 뷰가 화면에 보여질 준비가 되었을 때 한번 호출
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator

        return pageViewController
    }

    //MARK: 뷰컨트롤러에 영향을 미치는 변화가 발생하였을 때 호출
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        //UIPageViewController에서 보여질 viewController를 설정하기 위함
        
        // 수평탐색의 경우
        // forWard: 오 -> 왼, reverse: 왼 -> 오
        // setViewControllers의 UIViewController는 보여질 화면의 배열 및 첫 화면
        pageViewController.setViewControllers([context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }



    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()

        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map {
                //MARK: SwiftUI View를 UIKit이 알아 먹게 하기 위해서
                UIHostingController(rootView: $0) //UIHostingController는 UIViewController의 서브 클래스
            }
        }

        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            //MARK: viewController -> 넘어갈 뷰 (1->0번째로 넘어가면 0번째 뷰컨)
            // Page를 넘길때 뷰컨트롤 전
            guard let index = controllers.firstIndex(of: viewController) else {return nil}
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }

        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            //MARK: viewController -> 넘어갈 뷰 (0->1번째로 넘어가면 1번째 뷰컨)
            // Page를 넘길때 뷰컨트롤 후
            guard let index = controllers.firstIndex(of: viewController) else { return nil }

            if index + 1 == controllers.count { // index는 0부터 시작하기 때문
                return controllers.first
            }

            return controllers[index + 1]
        }

        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
}

