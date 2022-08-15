//
//  Models.swift
//  AppPage
//
//  Created by Giwan Jo on 2022/08/12.
//

import Foundation

// MARK: - AppleITunes
struct AppleITunes: Decodable {
    let resultCount: Int
    let results: [Detail]
}

// MARK: - Result
struct Detail: Decodable {
    let screenshotUrls: [String]
    let artworkUrl60, artworkUrl512, artworkUrl100: String
    let artistViewURL: String
    let kind, minimumOSVersion, trackCensoredName: String
    let languageCodesISO2A: [String] // 지원 언어
    let fileSizeBytes, formattedPrice, contentAdvisoryRating: String
    let averageUserRatingForCurrentVersion: Double
    let userRatingCountForCurrentVersion: Int
    let averageUserRating: Double
    let trackViewURL: String
    let trackContentRating: String
    let currentVersionReleaseDate: Date
    let releaseNotes, resultDescription, currency, sellerName: String
    let bundleID: String
    let releaseDate: Date
    let primaryGenreName: String
    let primaryGenreID, trackID: Int
    let trackName: String
    let artistID: Int
    let artistName: String
    let price: Int
    let version, wrapperType: String
    let userRatingCount: Int

    enum CodingKeys: String, CodingKey {
        case screenshotUrls, artworkUrl60, artworkUrl512, artworkUrl100
        case artistViewURL = "artistViewUrl"
        case kind
        case minimumOSVersion = "minimumOsVersion"
        case trackCensoredName, languageCodesISO2A, fileSizeBytes, formattedPrice, contentAdvisoryRating, averageUserRatingForCurrentVersion, userRatingCountForCurrentVersion, averageUserRating
        case trackViewURL = "trackViewUrl"
        case trackContentRating, currentVersionReleaseDate, releaseNotes
        case resultDescription = "description"
        case currency, sellerName
        case bundleID = "bundleId"
        case releaseDate, primaryGenreName
        case primaryGenreID = "primaryGenreId"
        case trackID = "trackId"
        case trackName
        case artistID = "artistId"
        case artistName, price, version, wrapperType, userRatingCount
    }
}
