//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import UIKit

public extension UIApplication {

    /// Overrides the user interface style adopted by all windows in all connected scenes.
    /// - Parameter userInterfaceStyle: The user interface style adopted by all windows in all connected scenes.
    func override(_ userInterfaceStyle: UIUserInterfaceStyle) {
        if #available(iOS 13.0, *), supportsMultipleScenes {
            for connectedScene in connectedScenes {
                if let scene = connectedScene as? UIWindowScene {
                    scene.windows.override(userInterfaceStyle)
                }
            }
        }
        else {
            windows.override(userInterfaceStyle)
        }
    }
}
