//
//  AppSection.swift
//  AppPage
//
//  Created by Giwan Jo on 2022/08/15.
//

import Foundation

enum AppSection {
    struct Headline {
        let image: String
        let title: String
        let desc: String
    }
    struct Feature {
        let title: String
        let desc: String
    }
    
    struct Preview {
        let image: String
    }
    
    case headline(Headline)
    case feature(Feature)
    case preview([Preview])
    
    var descriptionName: String {
        switch self {
        case .headline(_):
            return ""
        case .feature(_):
            return "세부설명"
        case .preview(_):
            return "스크린샷"
        }
    }
}
