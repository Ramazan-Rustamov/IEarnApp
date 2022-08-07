//
//  PagerComponent.swift
//  IEarn
//
//  Created by Ramazan Rustamov on 05.08.22.
//

import UIKit

class PagerComponent: UIPageViewController {
    
    var segments: [UIViewController] = [] {
        didSet {
            guard !segments.isEmpty else {return}
            setViewControllers([segments[0]], direction: .forward, animated: true)
        }
    }
    
    init() {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        dataSource = self
        delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PagerComponent: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = segments.firstIndex(of: viewController) else { return nil }
        
        // if it is the first page
        if viewControllerIndex == 0 {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else { return segments.last }
        
        guard segments.count > previousIndex else { return nil }
        
        return segments[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = segments.firstIndex(of: viewController) else { return nil }
        
        // if it is the last page
        if viewControllerIndex == segments.count - 1 {
            return nil
        }
                
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < segments.count else { return segments.first }
        
        guard segments.count > nextIndex else { return nil }
        
        return segments[nextIndex]
    }
    
    
}


