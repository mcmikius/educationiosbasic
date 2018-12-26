//
//  UIImageView+Extensions.swift
//  DMarketWallet
//
//  Created by Maksym Kravchenko on 6/6/18.
//  Copyright © 2018 globalgames.net. All rights reserved.
//

import UIKit
import AlamofireImage

extension UIImageView {

    func updateImage(with url: String, placeholderImage: UIImage?) {
        af_cancelImageRequest()

        guard let url = URL(string: url) else {
            image = placeholderImage
            return
        }

        af_setImage(
            withURL: url,
            placeholderImage: placeholderImage,
            imageTransition: .crossDissolve(0.2)
        )
    }

}

