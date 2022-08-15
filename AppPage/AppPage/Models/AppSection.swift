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
}
