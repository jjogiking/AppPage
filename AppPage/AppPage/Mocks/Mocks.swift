//
//  Mocks.swift
//  AppPage
//
//  Created by Giwan Jo on 2022/08/16.
//

import Foundation

enum AppDetailViewMock {
    static let dataSource: [AppSection] = [
        .headline(
            .init(
                image: "https://is5-ssl.mzstatic.com/image/thumb/Purple122/v4/c9/6d/98/c96d981e-271c-0159-5c92-fbeba5d135c1/logo_youtube_color-0-0-1x_U007emarketing-0-0-0-6-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/60x60bb.jpg",
                title: "test1"
                , desc: "test2"
            )
        ),
        
        .feature(
            .init(
                title: "description",
                desc: """
Get the official YouTube app on iPhones and iPads. See what the world is watching -- from the hottest music videos to what’s popular in gaming, fashion, beauty, news, learning and more. Subscribe to channels you love, create content of your own, share with friends, and watch on any device.\n\nWatch and subscribe\n● Browse personal recommendations on Home\n● See the latest from your favorite channels in Subscriptions\n● Look up videos you’ve watched, liked, and saved for later in Library\n\nExplore different topics, what’s popular, and on the rise (available in select countries)\n● Stay up to date on what’s popular in music, gaming, beauty, news, learning and more\n● See what’s trending on YouTube and around the world on Explore\n● Learn about the coolest Creators, Gamers, and Artists on the Rise (available in select countries)\n\nConnect with the YouTube community\n● Keep up with your favorites creators with Posts, Stories, Premieres, and Live streams\n● Join the conversation with comments and interact with creators and other community members\n\nCreate content from your mobile device\n● Create or upload your own videos directly in the app\n● Engage with your audience in real time with live streaming right from the app\n\nFind the experience that fits you and your family (available in select countries)\n● Every family has their own approach to online video. Learn about your options: the YouTube Kids app or a new parent supervised experience on YouTube at youtube.com/myfamily\n\nSupport creators you love with channel memberships (available in select countries)\n● Join channels that offer paid monthly memberships and support their work\n● Get access to exclusive perks from the channel & become part of their members community\n● Stand out in comments and live chats with a loyalty badge next to your username\n\nUpgrade to YouTube Premium (available in select countries)\n● Watch videos uninterrupted by ads, while using other apps, or when the screen is locked\n● Save videos for when you really need them – like when you’re on a plane or commuting\n● Get access to YouTube Music Premium as part of your benefits\n\nNote: If you subscribe via Apple, payment will be charged to App Store Account at confirmation of purchase. Subscription automatically renews unless auto-renew is turned off at least 24 hours before the end of the current period. Account will be charged for renewal within 24 hours prior to the end of the current period at the rate of the selected plan. Subscriptions and auto-renewal may be managed by going to Account Settings after purchase.\n\nMonthly price: $15.99 USD (US, TC) / $19.99 AUD / $20.99 NZD / $155MXN / £15.99GBP / €15.99 EUR (IE, DE, AT, FR, FI, IT, ES, BE, NL, LU) / $15.99 CAD / 149 kr SEK / 149 kr NOK / 249 ₽ RUB / 149 kr. DKK / R$27.90 BRL / CHF19.90 CHF / ¥1,550 JPY / USD$4.99 (UA, AR) / COP$22,900 / CLP$5,500 / S/.26.90 PEN / €10.99 EUR (PT, CY, GR, MT, EE, LT, LV) / ₹169.00 INR / R94.99 ZAR / USD$9.49 (CR, EC, DO, UY, GT, BO, HN, SV, PY, NI, PA, VE, BY, BM, KY) / 32.99 zł PLN / RON34.99 / 239.00 Kč CZK /  Ft2,390.00 HUF / lev14.99 BGN / USD$10.99 (MK) / €9.49 EUR (SK, SI) / ₺21.99 TRY / USD$18.59 (IS) / kn99.99 HRK /  ₪31.90 ILS / dh32.99 AED / Rial32.99 SAR / Rial32.99 QAR / USD$7.99 (BH, KW, OM, LB, PG) / Rp79,000 IDR / NT$230.00 TWD / ฿209.00 THB / ₱209.00 PHP / $88.00 HKD / RM23.90 MYR / $15.98 SGD / ₦1,500.00 NGN / £79.99 EGP\n\nYouTube paid service terms: https://www.youtube.com/t/terms_paidservice.\nPrivacy policy: https://www.google.com/policies/privacy
"""
            )
        ),
        
        .preview([
            "https://is1-ssl.mzstatic.com/image/thumb/Purple112/v4/a8/ba/eb/a8baeb84-c246-eb08-35c0-28f22a0eee9e/dab4e6da-5c09-4959-9cb0-cf8204ce0d61_EN-US1-ShortsCreation-5.5_1242_U200a_U00d7_U200a2208.png/392x696bb.png",
            "https://is1-ssl.mzstatic.com/image/thumb/Purple122/v4/ca/ac/46/caac4625-ccc7-330d-e74e-a8da4b45c2bf/d92620be-5f49-4152-b689-88dbf8cd991a_iOS-5.5-in_1.png/392x696bb.png",
            "https://is4-ssl.mzstatic.com/image/thumb/Purple122/v4/03/ca/63/03ca63b1-28d6-e164-193b-74e2dd4fd3ed/0aac5032-4ae3-48c7-bbea-be6fbb6bcdbd_iOS-5.5-in_2.png/392x696bb.png",
            "https://is3-ssl.mzstatic.com/image/thumb/Purple112/v4/4a/a6/46/4aa64646-67b9-ec6f-5e66-47d164df1a01/4fb3cc2d-f1b1-481f-8f0f-cf73843d7cd7_iOS-5.5-in_3.png/392x696bb.png",
            "https://is3-ssl.mzstatic.com/image/thumb/Purple112/v4/6b/a3/92/6ba39240-d2a1-946b-4dcf-a5a713531498/81d504a7-d2fc-4b4b-bbdb-d371d5342158_iOS-5.5-in_4.png/392x696bb.png"].map { .init(image: $0)}
        )
    ]
}
