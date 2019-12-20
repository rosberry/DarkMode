//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import UIKit

public extension UserDefaults {

    ///Saved overrided user interface style.
    var overridedUserInterfaceStyle: UIUserInterfaceStyle {
        get {
            UIUserInterfaceStyle(rawValue: integer(forKey: #function)) ?? .unspecified
        }
        set {
            set(newValue.rawValue, forKey: #function)
        }
    }
}
