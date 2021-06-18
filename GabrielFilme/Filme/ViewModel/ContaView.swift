//
//  ContaView.swift
//  GabrielFilme
//
//  Created by Gabriel Aderaldo on 15/06/21.
//

import Foundation


struct FilmeView{

    var id:Int = 0
    var title:String = ""
    var overview:String = ""
    var urlImage:String = ""
    var popularity:Double = 0.0
    var release_date:String = ""

}



class FilmeViewModel{
    
    static func save(_ filme:Filme){
        try? uiRealm.write{
            uiRealm.add(filme,update: .modified)
        }
    }
    
    static func save(_ filmes:[Filme]){
        self.removeConta()
        try? uiRealm.write{
            uiRealm.add(filmes, update: .modified)
        }
    }
    
    static func removeConta(){
        let object = uiRealm.objects(Filme.self)

        try? uiRealm.write{
            uiRealm.delete(object)
        }
    }
    
    
    static func getAsModel(_ filmeView:FilmeView) -> Filme{
        let filme = Filme()
        
        filme.id.value = filmeView.id
        filme.title = filmeView.title
        filme.overview = filmeView.overview
        filme.urlImage = filmeView.urlImage
        filme.popularity.value = filmeView.popularity
        filme.release_date = filmeView.release_date
        
        return filme
    }
    
    static func getAsView(_ filme:Filme?) -> FilmeView{
        guard let filme = filme else { return FilmeView() }
        var filmeView = FilmeView()
        
        filmeView.id    = filme.id.value ?? 0
        filmeView.title = filme.title ?? ""
        filmeView.overview = filme.overview ?? ""
        filmeView.urlImage = filme.urlImage ?? ""
        filmeView.popularity = filme.popularity.value ?? 0.0
        filmeView.release_date = filme.release_date ?? ""
        
        return filmeView
    }
    
    static func getAsView(sequence:[Filme]) -> [FilmeView]{
        var filmes:[FilmeView] = []
        
        sequence.forEach { (filme) in
            filmes.append(self.getAsView(filme))
        }
        
        return filmes
    }
    
    static func get() -> [Filme]{
        
        let result = uiRealm.objects(Filme.self)
        
        var filmes:[Filme] = []
        filmes.append(contentsOf: result)
        return filmes
        
    }
    
    static func getViews() -> [FilmeView]{
        
        return self.getAsView(sequence: self.get())
        
    }
    
    
    static func getFilme() -> Filme?{
        return uiRealm.objects(Filme.self).first 
    }
    
    
    static func getFilmeView() -> FilmeView{
        return self.getAsView(self.getFilme())
    }
    
    
}
