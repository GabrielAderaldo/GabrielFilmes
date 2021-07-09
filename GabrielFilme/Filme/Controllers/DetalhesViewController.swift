//
//  DetalhesViewController.swift
//  GabrielFilme
//
//  Created by Gabriel Aderaldo on 16/06/21.
//

import UIKit

class DetalhesViewController: UIViewController {
  
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbNome: UILabel!
    @IBOutlet weak var lbPopulariedade: UILabel!
    @IBOutlet weak var lbDatadeLancamento: UILabel!
    @IBOutlet weak var lbGenero: UILabel!
    @IBOutlet weak var lbSinopse: UILabel!
    
    var detalhes:[DetalhesView] = []
    var detalhesService: FilmeService!
    
    
    var filmeId:Int = 0
    var filmeNome:String = ""
    var popularidade:Double = 0.0
    var dataLancamento:String = ""
    var url:String = ""
    var descricao:String = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detalhesService = FilmeService(delegate: self)
        self.detalhesService.detalhesFilme(id: filmeId)
        arrendondar(view: img)
        bind()
        
    }
    
    @IBAction func bntVoltar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func colocarArray(){
        for detalhe in DetalhesViewModel.getViews(){
            detalhes.append(detalhe)
        }
    }
    
    func bind(){
        
        self.img.kf.setImage(with: URL(string: url),placeholder: nil,options: [.transition(.fade(0.7))],progressBlock: nil)
        self.lbNome.text = self.filmeNome
        self.lbPopulariedade.text = "\(self.popularidade)"
        self.lbDatadeLancamento.text = self.dataLancamento
        self.lbSinopse.text = self.descricao
        
    }
    
    func arrendondar(view:UIView){
        view.clipsToBounds = false
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
    }


}

extension DetalhesViewController:ServiceDelegate{
    func sucess(type: ResponseType) {
        colocarArray()
    
        
        self.lbGenero.text = "\(detalhes[0].name)"
        
        }
    
    func failure(type: ResponseType, error: String) {
        print("Falha")
    }
}
