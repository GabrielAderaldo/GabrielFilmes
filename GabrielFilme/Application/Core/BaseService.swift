//
//  BaseService.swift
//  GabrielFilme
//
//  Created by Gabriel Aderaldo on 15/06/21.
//

import Foundation



protocol ServiceDelegate {
    
    func sucess(type: ResponseType)
    func failure(type: ResponseType, error: String)
    
}
