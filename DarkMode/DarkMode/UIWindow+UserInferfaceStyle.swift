//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import UIKit

public extension UIWindow {

    /// Overrides the user interface style adopted by the view and all of its subviews.
    /// - Parameter userInterfaceStyle: The user interface style adopted by the view and all of its subviews.
    func override(_ userInterfaceStyle: UIUserInterfaceStyle) {
        if #available(iOS 13.0, tvOS 13.0, *) {
            overrideUserInterfaceStyle = userInterfaceStyle
        }
    }
}

public extension Array where Element: UIWindow {

    /// Overrides the user interface style adopted by all elements.
    /// - Parameter userInterfaceStyle: The user interface style adopted by all elements.
    func override(_ userInterfaceStyle: UIUserInterfaceStyle) {
        for window in self {
            window.override(userInterfaceStyle)
        }
    }
}
