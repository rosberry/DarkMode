//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController {

    //MARK: - Subviews

    @IBOutlet weak var segmentedControl: UISegmentedControl!

    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.selectedSegmentIndex = UserDefaults.standard.overridedUserInterfaceStyle.rawValue
    }

    // MARK: - Actions

    @IBAction private func valueChanged(_ sender: Any) {
        guard let style = UIUserInterfaceStyle(rawValue: segmentedControl.selectedSegmentIndex) else {
            return
        }
        UIApplication.shared.override(style)
        UserDefaults.standard.overridedUserInterfaceStyle = style
    }

    @IBAction private func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

#if canImport(SwiftUI) && DEBUG

import SwiftUI

struct SettingsViewControllerRepresentable: UIViewRepresentable {

    func makeUIView(context: Context) -> UIView {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return makeUIView(context: context, storyboard: storyboard, identifier: "SettingsViewController")
    }

    func updateUIView(_ view: UIView, context: Context) {

    }
}

@available(iOS 13.0, *)
struct SettingsViewController_Preview: PreviewProvider {

    static var previews: some View {
        Group {
            SettingsViewControllerRepresentable()
                .colorScheme(.light)
                .previewDisplayName("Light Mode")
            SettingsViewControllerRepresentable()
                .colorScheme(.dark)
                .previewDisplayName("Dark Mode")
        }
    }
}

#endif
