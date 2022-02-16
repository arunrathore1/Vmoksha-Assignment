//
//  CustomImageView.swift
//  Vmoksha Assignment
//
//  Created by Arun Rathore on 16/02/22.
//


import UIKit

class CustomImageView: UIImageView {
    var imageUrlString: String?
    
    func loadImageUsingUrlString(urlString: String) {
        imageUrlString = urlString
        guard let url = URL(string: urlString) else { return }
        self.image = nil
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            return
        }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, respones, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }
            DispatchQueue.main.async {
                guard let imageToCache = UIImage(data: data!) else { return }
                if self.imageUrlString == urlString { self.image = imageToCache }
                imageCache.setObject(imageToCache, forKey: urlString as NSString)
            }
        }).resume()
    }
    
}
