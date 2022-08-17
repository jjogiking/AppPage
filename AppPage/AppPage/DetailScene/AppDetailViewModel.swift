//
//  AppDetailViewModel.swift
//  AppPage
//
//  Created by Giwan Jo on 2022/08/17.
//

import Foundation

class AppDetailViewModel {
    private(set) var dataSource: [AppSection] = []
    
    init(_ detail: Detail) {
        dataSource = [
            .headline(
                .init(
                    image: detail.artworkUrl100,
                    title: detail.trackName,
                    desc: detail.artistName
                )
            ),
            .feature(
                .init(
                    title: detail.releaseNotes,
                    desc: detail.resultDescription
                )
            ),
            .preview(
                detail.screenshotUrls.map {
                    .init(image: $0)
                }
            )
        ]
    }
}
