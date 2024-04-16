// All rights reserved. Copyright © 2024 Adam Kramár.  

import UIKit

extension String {
    private static let dimensionsPlaceholder = "WIDTHxHEIGHT"

    private func getResolvedImageURLString(for size: CGSize) -> String {
        guard contains(String.dimensionsPlaceholder) else {
            return self
        }

        let scale = UIScreen.main.scale
        let height = Int(size.height * scale)
        let width = Int(size.width * scale)
        return replacingOccurrences(of: String.dimensionsPlaceholder, with: "\(width)x\(height)")
    }

    func getResolvedImageURL(for size: CGSize) -> URL? {
        URL(string: getResolvedImageURLString(for: size))
    }
}
