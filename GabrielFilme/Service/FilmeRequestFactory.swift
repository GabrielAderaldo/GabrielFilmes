//
//  FilmeRequestFactory.swift
//  GabrielFilme
//
//  Created by Gabriel Aderaldo on 15/06/21.
//

import Foundation
import Alamofire


class FilmeRequestFactory{
  
    
    static func listar() -> DataRequest{
        //Aqui fica onde pode trocar as informações...
        let apiKey = "ea304227246815763c11d8901d0be249"
        let nPaginas = "2"
        let linguagem = "pt-BR"
        let baseURL = "https://api.themoviedb.org/3/movie/upcoming"
        
        return Alamofire.request("https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)&language=pt-BR&page=1")
    }
    
    
    
    static func listagemDetalhes(id:Int) -> DataRequest{
        let apiKey = "ea304227246815763c11d8901d0be249"
        let nPaginas = "2"
        let linguagem = "pt-BR"
        let baseURL = "https://api.themoviedb.org/3/movie/upcoming"
        
        return Alamofire.request("https://api.themoviedb.org/3/movie/\(id)?api_key=\(apiKey)&language=pt-BR")
    }
    
}
