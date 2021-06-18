//
//  ListagemTableViewCell.swift
//  GabrielFilme
//
//  Created by Gabriel Aderaldo on 16/06/21.
//

import UIKit
import Kingfisher

class ListagemTableViewCell: UITableViewCell {

    @IBOutlet weak var backGround: UIView!
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lbNomeFilme: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        arrendondar(view: backGround)
        sombra(view: backGround, radius: 10)
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(nome:String,url:String){
        var baseURL = "https://image.tmdb.org/t/p/w185\(url)"
        
        lbNomeFilme.text = nome
        imgView.kf.setImage(with: URL(string: baseURL),placeholder: nil,options: [.transition(.fade(0.7))],progressBlock: nil)
    }
    
    func sombra(view:UIView,radius:Int){
            view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
            view.layer.shadowRadius = CGFloat(radius)
            view.layer.shadowOffset = .zero
            view.layer.shadowOpacity = 1
            
        }
        
        func arrendondar(view:UIView){
            view.clipsToBounds = false
            view.layer.cornerRadius = 8
            view.layer.masksToBounds = true
        }
    
}
