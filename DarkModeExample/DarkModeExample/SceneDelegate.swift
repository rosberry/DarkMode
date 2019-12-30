//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import UIKit
import DarkMode

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        window?.override(UserDefaults.standard.overridedUserInterfaceStyle)
    }
}
