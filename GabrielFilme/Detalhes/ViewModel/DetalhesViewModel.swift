//
//  DetalhesViewModel.swift
//  GabrielFilme
//
//  Created by Gabriel Aderaldo on 17/06/21.
//

import Foundation

struct DetalhesView {
    var id:Int = 0
    var name:String = ""
}


class DetalhesViewModel {
    
    
    static func save(_ filmeDetalhes:Detalhes){
        try? uiRealm.write{
            uiRealm.add(filmeDetalhes,update: .modified)
        }
    }
    
    static func save(_ filmesDetalhe:[Detalhes]){
        self.remocaoDetalhes()
        try? uiRealm.write{
            uiRealm.add(filmesDetalhe,update: .modified)
        }
    }
    
    static func remocaoDetalhes(){
        let object = uiRealm.objects(Detalhes.self)
        
        try? uiRealm.write{
            uiRealm.delete(object)
        }
    }
    
    static func getAsModel(_ detalhesView:DetalhesView) -> Detalhes{
        let detalhes = Detalhes()

        detalhes.id.value = detalhesView.id
        detalhes.name = detalhesView.name
        
        
        return detalhes
    }
    
    static func getAsView(_ detalhe:Detalhes?) -> DetalhesView{
        
        guard let detalhe = detalhe else {
            return DetalhesView()
        }
        
        var detalheView = DetalhesView()
        detalheView.id = detalhe.id.value ?? 0
        detalheView.name = detalhe.name ?? ""
        
        return detalheView
        
    }
    
    
    static func getAsView(sequence: [Detalhes]) -> [DetalhesView]{
        var detalhes:[DetalhesView] = []
        
        sequence.forEach { (detalhe) in
            detalhes.append(self.getAsView(detalhe))
        }
        
       return detalhes
    }
    
    static func get() -> [Detalhes]{
        let result = uiRealm.objects(Detalhes.self)
        
        var detalhes:[Detalhes] = []
        detalhes.append(contentsOf: result)
        return detalhes
    }
    
    static func getViews() -> [DetalhesView]{
        return self.getAsView(sequence: self.get())
    }
    
    static func getDetalhe() -> Detalhes{
        return uiRealm.objects(Detalhes.self).first ?? Detalhes()
    }
    
    static func getDetalhesView() -> DetalhesView{
        return self.getAsView(self.getDetalhe())
    }
    
    
    
    
}
