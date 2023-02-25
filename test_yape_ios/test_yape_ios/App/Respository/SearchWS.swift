//
//  SearchWS.swift
//  test_yape_ios
//
//  Created by iMac on 24/02/23.
//

import Foundation

class SearchWS {
    static func getTextSearch(text: String, idUser: String, complete: @escaping ((Bool, ListRecipes?, String) -> Void)) {
        let url = getBASE_UREL() + "/yape/api/getTextSearch"
        let dic = ["text": text, "idUser": idUser]
        ApiServices().requestHttpwithUrl(EpUrl: url, method: .post, withData: dic, modelType: UserData.self) { success, userData, error in
            DispatchQueue.main.async {
                //complete(success, userData, error?.localizedDescription ?? "")
            }
        }
    }
    
    static func createTextSearch(text: String, idUser: String, complete: @escaping ((Bool, ListRecipes?, String) -> Void)) {
        let url = getBASE_UREL() + "/yape/api/addTextSearch"
        let dic = ["text": text, "idUser": idUser]
        ApiServices().requestHttpwithUrl(EpUrl: url, method: .post, withData: dic, modelType: UserData.self) { success, userData, error in
            DispatchQueue.main.async {
                //complete(success, userData, error?.localizedDescription ?? "")
            }
        }
    }
}
