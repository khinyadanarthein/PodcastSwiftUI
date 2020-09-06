//
//  BaseApi.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 02/09/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

open class BaseApiClient {

    //static let BASE_URL =  "https://listen-api.listennotes.com/api/v2/"
    static let BASE_URL =  "https://2f104bf0-c26f-4b7a-9738-5310d4974833.mock.pstmn.io/ok/"
    
    public var session : Session = AF
    
    public func setNetworkClient(session : Session) {
        self.session = session
    }
    
    func requestApi(
        url: String,
        method: HTTPMethod,
        params: Parameters,
        encoding: ParameterEncoding = URLEncoding.default,
        success: @escaping(Data) -> Void,
        fail: @escaping(String) -> Void
    ){
        let header : HTTPHeaders = [
            HEADER_API_KEY : API_VALUE
        ]
        self.session.request(BaseApiClient.BASE_URL + url, method: method, parameters: params,encoding: encoding, headers: header).responseJSON { (response) in
            
            switch response.result {
            case .success:
                if  200 ... 299 ~= response.response?.statusCode ?? 500   {
                    success(response.data!)
                } else {
                
                    if response.response?.statusCode ?? 500 == 403 {
                        fail("Invalid Token")
                    }else{
                        let error:ErrorResponse? = response.data?.seralizeData()
                        fail(error?.message ?? "Input Error")
                    }
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
                fail(error.localizedDescription)
            }
        }
    }
}
