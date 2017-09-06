//
//  ServerManager.swift
//  IOSDevTestTask
//
//  Created by macMini on 9/4/17.
//  Copyright © 2017 macMini. All rights reserved.
//

import UIKit
import Alamofire

class ServerManager: NSObject {
    static let shared = ServerManager()
    
    func getTranslatedText(text: String, translateFromLanguage: String, translateToLanguage: String, completion: @escaping(_ result: [String]) -> Void) {
        let url = "https://translate.yandex.net/api/v1.5/tr.json/translate?"
        let direction = translateFromLanguage + "-" + translateToLanguage
        let parameters = [Consts.key: Consts.apiKey, Consts.text: text, Consts.language: direction]
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON(completionHandler: {
            response in
            var result = [String]()
            
            if let JSON = response.result.value as? [String: Any]{
                if let translatedText = JSON[Consts.text]{
                    result = translatedText as! [String]
                }
            }
            completion(result)
        })
    }
}
