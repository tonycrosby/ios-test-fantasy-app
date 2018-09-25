//
//  ImageRequestHelper.swift
//  FinalApp
//
//  Created by Tony Crosby on 11/29/17.
//  Copyright © 2017 Tony Crosby. All rights reserved.
//

import Foundation
import Alamofire

class ImageRequestHelper {
    func GetImage(imageURL: String, callback:@escaping (Data) -> ()) {
    
        let imageURLObj = URL(string: imageURL)!
        
        Alamofire.request(imageURLObj)
            .responseData { response in
                guard let imageData = response.data else {
                    print("Could not get image from image URL")
                    return
                }
                if response.data!.isEmpty {
                    print("Empty response")
                    return
                }
                callback(imageData)
        }
    }
}
