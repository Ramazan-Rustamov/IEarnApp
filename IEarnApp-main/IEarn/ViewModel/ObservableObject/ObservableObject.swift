//
//  ObservableObject.swift
//  IEarn
//
//  Created by Ramazan Rustamov on 10.08.22.
//

import Foundation

final class ObservableObject<T> {
  
  var listener: ((T?) -> Void)?
  
  var value: T? {
    didSet {
      listener?(value)
    }
  }
  
  init(_ value: T) {
    self.value = value
  }
  
  func bind(listener: ((T?) -> Void)?) {
    self.listener = listener
    listener?(value)
  }
}
