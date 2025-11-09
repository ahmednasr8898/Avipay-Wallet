//
//  Fonts.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 09/11/2025.
//

import SwiftUI


extension Font {
    static var heading1: Font {
        dmSans(size: 56, weight: .medium)
    }

    static var heading2: Font {
        dmSans(size: 44, weight: .medium)
    }

    static var heading3: Font {
        dmSans(size: 24, weight: .medium)
    }

    static var heading4: Font {
        dmSans(size: 18, weight: .medium)
    }

    static var bodyText: Font {
        dmSans(size: 16, weight: .regular)
    }

    static var bodyMedium: Font {
        dmSans(size: 16, weight: .medium)
    }

    static var caption: Font {
        dmSans(size: 14, weight: .regular)
    }

    static var caption1: Font {
        dmSans(size: 12, weight: .regular)
    }

    static var caption2: Font {
        dmSans(size: 13, weight: .regular)
    }

    static var captionMedium: Font {
        dmSans(size: 14, weight: .medium)
    }

    static var button: Font {
        dmSans(size: 16, weight: .medium)
    }

    static var button1: Font {
        dmSans(size: 14, weight: .medium)
    }
}


// MARK: UIFont Helpers


private extension Font {
    /// Returns Font instance with the specified Style.
    static func dmSans(size: CGFloat, weight: Font.Weight) -> Font {
        let fontName = dmSansFontName(for: weight)
        return Font.custom(fontName, size: size)
    }

    /// Returns Font file name for the given weight.
    static func dmSansFontName(for weight: Font.Weight) -> String {
        switch weight {
        case .medium:
            return "DMSans-Medium"
        default:
            return "DMSans-Regular"
        }
    }
}
