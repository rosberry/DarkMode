//
//  Copyright © 2019 Rosberry. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - Subviews
    
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageTitleLabel: UILabel!
    @IBOutlet weak var layerTitleLabel: UILabel!

    lazy var layer: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.layer.cgColor
        layer.cornerRadius = 8
        return layer
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Color")
        view.layer.addSublayer(layer)

        let imageAsset = UIImageAsset(lightModeImage: UIImage(named: "RedRectangle"),
                                      darkModeImage: UIImage(named: "GreenRectangle"))
        imageView.layer.cornerRadius = 8
        imageView.image = imageAsset.image()

        visualEffectView.layer.masksToBounds = true
        visualEffectView.layer.cornerRadius = 8
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layer.frame = CGRect(x: imageView.frame.minX,
                             y: layerTitleLabel.frame.maxY + 8,
                             width: imageView.bounds.width,
                             height: imageView.bounds.height)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        traitCollection.performForDifferentColorAppearance(comparedTo: previousTraitCollection) {
            layer.backgroundColor = UIColor.layer.cgColor
        }
    }
}

#if canImport(SwiftUI) && DEBUG

import SwiftUI

struct ViewControllerRepresentable: UIViewRepresentable {

    func makeUIView(context: Context) -> UIView {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
        return viewController.view
    }

    func updateUIView(_ view: UIView, context: Context) {

    }
}

@available(iOS 13.0, *)
struct ViewController_Preview: PreviewProvider {

    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .colorScheme(.light)
                .previewDisplayName("Light Mode")
            ViewControllerRepresentable()
                .colorScheme(.dark)
                .previewDisplayName("Dark Mode")
        }
    }
}

#endif
