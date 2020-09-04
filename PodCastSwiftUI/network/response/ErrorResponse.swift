//
//  ErrorResponse.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 02/09/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation

class ErrorResponse:Codable {
    
    let message:String
}

extension Data{
    
    func seralizeData<T:Codable>() -> T?{
        
        do{
            
            let data = try JSONDecoder().decode(T.self, from: self)
            return data
            
        }catch let ex {
            
            debugPrint(ex.localizedDescription)
            return nil
        }
        
    }
}
