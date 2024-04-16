// All rights reserved. Copyright © 2024 Adam Kramár.  

import SwiftUI

struct GamesUI {
    let name: String
    let games: [GameUI]
}

struct GameUI: Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let metacriticRating: Int?
    let gameInfo: [GameInfoUI]
    let platforms: [GamePlatformUI]?

    var metacriticRatingText: String? {
        guard let metacriticRating else { return nil }

        return String(metacriticRating)
    }

    var plafromsImages: [ImageResource]? {
        let allImages = platforms?.compactMap { $0.iconImage }
        guard let allImages else { return nil }

        return Array(Set(allImages))
    }
}

enum GameInfoUI: Hashable {
    case releaseDate(String)
    case genres(String)
    case rating (String)

    var key: String {
        switch self {
        case .releaseDate:
            "Release date:"
        case .genres:
            "Genres:"
        case .rating:
            "Rating:"
        }
    }

    var value: String {
        switch self {
        case .releaseDate(let releaseDate):
            releaseDate
        case .genres(let genres):
            genres
        case .rating(let rating):
            rating
        }
    }
}

enum GamePlatformUI: String, Hashable {
    case windows = "pc"
    case playstation, playstation5, playstation4, playstation3, playstation2, playstation1, psvita = "ps-vita", psp
    case xbox, xboxseriesx = "xbox-series-x", xbox360, xboxold = "xbox-old"
    case android
    case ios, mac, macos, macintosh, appleii = "apple-ii"
    case linux
    case nintendo, nswitch = "nintendo-switch", n3ds = "nintendo-3ds", nds = "nintendo-ds", ndsi = "nintendo-dsi", wiiu = "wii-u", wii
    case gamecube, n64 = "nintendo-64", gba = "game-boy-advance", gbc = "game-boy-color", gameboy = "game-boy", snes, nes
    case atari, atari7800 = "atari-7800", atari5200 = "atari-5200", atari2600 = "atari-2600", atariflashback = "atari-flashback"
    case atari8bit = "atari-8-bit", atarist = "atari-st", atarilynx = "atari-lynx", atarixegs = "atari-xegs", jaguar, genesis
    case sega, saturn = "sega-saturn", scd = "sega-cd", s32x = "sega-32x", sms = "sega-master-system", dreamcast, gamegear = "game-gear"
    case web

    var iconImage: ImageResource {
        switch self {
        case .windows:
            .windows
        case .playstation, .playstation1, .playstation2, .playstation3, .playstation4, .playstation5, .psvita, .psp:
            .playstation
        case .xbox, .xboxseriesx, .xbox360, .xboxold:
            .xbox
        case .android:
            .android
        case .ios, .mac, .macos, .macintosh, .appleii:
            .apple
        case .linux:
            .linux
        case .nintendo, .nswitch, .n3ds, .nds, .ndsi, .wiiu, .wii, .gamecube, .n64, .gba, .gbc, .gameboy, .snes, .nes:
            .nintendo
        case .web:
            .web
        default:
            .defaultIcon
        }
    }
}
