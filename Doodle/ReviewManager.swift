//
//  ReviewManager.swift
//  Doodle
//
//  Created by Joe Blau on 4/16/20.
//  Copyright © 2020 Joe Blau. All rights reserved.
//

import Foundation
import StoreKit

final class ReviewManager {
    static let kOpenCount = "application_open_count"
    
    func requestReview() {
        let openCount = UserDefaults.standard.integer(forKey: ReviewManager.kOpenCount)
        
        switch openCount {
        case 3, 10, 50:
            SKStoreReviewController.requestReview()
        case _ where openCount > 3 && openCount % 100 == 0:
            SKStoreReviewController.requestReview()
        default: break
        }
        
        UserDefaults.standard.set(openCount+1, forKey: ReviewManager.kOpenCount)
    }
}
