//
//  UIViewControllerExtension.swift
//  LocationTrackingApp
//
//  Created by Purushottam Padhya on 27/1/22.
//

import UIKit

extension UIViewController{
    func showAlert(title: String = "Alert", msg: String, completion: @escaping ()->() = {}) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default){ _ in
            completion()
        })
        self.present(alert, animated: true)
    }
    
    func showLocationPermissionAlert(title: String = "No permission", msg: String, completion: @escaping ()->() = {}) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Open Settings", style: .default, handler: { action in
            guard let URL = Foundation.URL(string: UIApplication.openSettingsURLString) else { return }
                    UIApplication.shared.open(URL, options: [:], completionHandler: nil)

        }))
        self.present(alert, animated: true)
    }
}
