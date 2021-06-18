//
//  FilmeService.swift
//  GabrielFilme
//
//  Created by Gabriel Aderaldo on 15/06/21.
//

import Foundation
import Alamofire
import AlamofireObjectMapper


class FilmeService{
    
    var listarRequest:Request?
    var detalhesRequest:Request?
    
    var delegate:ServiceDelegate?
    
    init(delegate: ServiceDelegate) {
        self.delegate = delegate
    }
    
    func detalhesFilme(id:Int){
        
        self.detalhesRequest?.cancel()
        self.detalhesRequest = FilmeRequestFactory.listagemDetalhes(id: id).validate().responseArray(keyPath:"genres",completionHandler: { (response: DataResponse <[Detalhes]>) in
            switch response.result{
                case .success:
                    if let detalhes = response.value{
                        DetalhesViewModel.save(detalhes)
                    }
                    self.delegate?.sucess(type: .listagemDetalhes)
            case .failure(let error):
                self.delegate?.failure(type: .listagemDetalhes, error: error.localizedDescription)
            }
        })
        
        
    }
    
    func listagemFilmes(){
        
        self.listarRequest?.cancel()
        self.listarRequest = FilmeRequestFactory.listar().validate().responseArray(keyPath:"results",completionHandler: {(response: DataResponse <[Filme]>) in
            
            switch response.result{
            
            case .success:
                if let filme = response.value{
                    FilmeViewModel.save(filme)
                }
                self.delegate?.sucess(type: .listagem)
            
            case .failure(let error):
                self.delegate?.failure(type: .listagem, error: error.localizedDescription)
            }
            
            
        })
        
    }
    
}
