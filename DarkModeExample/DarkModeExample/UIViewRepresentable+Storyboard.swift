//
//  ViewControllerRepresentable.swift
//  DarkModeExample
//
//  Created by Artem Novichkov on 20.12.2019.
//  Copyright © 2019 Rosberry. All rights reserved.
//

#if canImport(SwiftUI) && DEBUG

import SwiftUI

extension UIViewRepresentable {

    func makeUIView(context: Context, storyboard: UIStoryboard, identifier: String) -> UIView {
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        return viewController.view
    }
}

#endif
