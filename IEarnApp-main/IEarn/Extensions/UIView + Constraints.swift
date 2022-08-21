//
//  UIView + Constraints.swift
//  IEarn
//
//  Created by Ramazan Rustamov on 19.08.22.
//

import UIKit

extension UIView {
    
    var allConstraints: [NSLayoutConstraint] {
        get {
            // array will contain self and all superviews
            var views = [self]

            // get all superviews
            var view = self
            while let superview = view.superview {
                views.append(superview)
                view = superview
            }

            // transform views to constraints and filter only those
            // constraints that include the view itself
            return views.flatMap({ $0.constraints }).filter { constraint in
                return constraint.firstItem as? UIView == self ||
                    constraint.secondItem as? UIView == self
            }
        }
    }
    
    var topConstraint: NSLayoutConstraint? {
        get {
            allConstraints.filter {$0.firstAttribute == .top}.first
        }
    }

    var bottomConstraint: NSLayoutConstraint? {
        get {
            allConstraints.filter {$0.firstAttribute == .bottom}.first
        }
    }

    var leadingConstraint: NSLayoutConstraint? {
        get {
            allConstraints.filter {$0.firstAttribute == .leading}.first
        }
    }

    var trailingConstraint: NSLayoutConstraint? {
        get {
            allConstraints.filter {$0.firstAttribute == .trailing}.first
        }
    }

    var heightConstraint: NSLayoutConstraint? {
        get {
            allConstraints.filter {$0.firstAttribute == .height}.first
        }
    }

    var widthConstraint: NSLayoutConstraint? {
        get {
            allConstraints.filter {$0.firstAttribute == .width}.first
        }
    }

    var centerYConstraint: NSLayoutConstraint? {
        get {
            allConstraints.filter {$0.firstAttribute == .centerY}.first
        }
    }

    var centerXConstraint: NSLayoutConstraint? {
        get {
            allConstraints.filter {$0.firstAttribute == .centerX}.first
        }
    }
}

