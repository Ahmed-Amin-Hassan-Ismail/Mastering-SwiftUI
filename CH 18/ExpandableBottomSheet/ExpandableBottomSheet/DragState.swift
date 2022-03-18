//
//  DragState.swift
//  ExpandableBottomSheet
//
//  Created by Ahmed Amin on 18/03/2022.
//

import Foundation
import SwiftUI


enum DragState {
    case inactive
    case pressing
    case dragging(transaction: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .pressing:
            return .zero
        case .dragging(let transaction):
            return transaction
        }
    }
    
    var isDragging: Bool {
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
