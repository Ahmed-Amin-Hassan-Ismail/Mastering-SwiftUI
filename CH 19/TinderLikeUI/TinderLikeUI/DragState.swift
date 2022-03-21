//
//  DragState.swift
//  TinderLikeUI
//
//  Created by Ahmed Amin on 21/03/2022.
//

import Foundation
import SwiftUI


enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .pressing:
            return false
        case .dragging(_):
            return true
        }
    }
    
    var isPressing: Bool {
        switch self {
        case .inactive:
            return false
        case .pressing:
            return true
        case .dragging(_):
            return true
        }
    }
}
