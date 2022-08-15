//
//  AppSection.swift
//  AppPage
//
//  Created by Giwan Jo on 2022/08/15.
//

import UIKit

enum AppSection {
    struct Headline {
        let image: UIImage
        let title: String
        let desc: String
    }
    struct Feature {
        let title: String
        let desc: String
    }
    
    struct Preview {
        let image: UIImage
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
