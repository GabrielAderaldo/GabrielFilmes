//  ViewController.swift
//  GabrielFilme
//
//  Created by Gabriel Aderaldo on 15/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    var filmeService: FilmeService!
    var filmes:[FilmeView] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colocarFilmeNoArray()
        tableViewSetup()
        self.filmeService.listagemFilmes()
        
    }
    
    func colocarFilmeNoArray(){
        for filme in FilmeViewModel.getViews() {
            filmes.append(filme)
        }
      
    }
    
    func tableViewSetup(){
        tableViewLayout()
        tableViewReusable()
        tableViewDelegates()
        
    }
    
    func tableViewLayout(){
        self.tableView.backgroundColor = .white
        self.tableView.separatorStyle = .none
        self.tableView.estimatedRowHeight = 300
    }
    
    
    func tableViewReusable(){
        self.tableView.register(UINib(nibName: "ListagemTableViewCell", bundle:nil), forCellReuseIdentifier: "ListagemTableViewCell")
    }
    
    func tableViewDelegates(){
        
        self.filmeService = FilmeService(delegate: self)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detalhesStoryBoard = StoryboardScene.Main.detalhesViewController.instantiate()
        
        detalhesStoryBoard.filmeId = filmes[indexPath.row].id
        detalhesStoryBoard.filmeNome = filmes[indexPath.row].title
        detalhesStoryBoard.popularidade = filmes[indexPath.row].popularity
        detalhesStoryBoard.dataLancamento = filmes[indexPath.row].release_date
        detalhesStoryBoard.url = "https://image.tmdb.org/t/p/w185\(filmes[indexPath.row].urlImage)"
        
        detalhesStoryBoard.modalPresentationStyle = .fullScreen
        self.present(detalhesStoryBoard, animated: true)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ListagemTableViewCell", for: indexPath) as? ListagemTableViewCell{
            cell.bind(nome:filmes[indexPath.row].title,url: filmes[indexPath.row].urlImage)
                return cell
        }
        return UITableViewCell()
    }
    
    
    
}

extension ViewController:ServiceDelegate{
    
    
    func sucess(type: ResponseType) {
        print("Requisição feita com sucesso!")
       
    }
    
    func failure(type: ResponseType, error: String) {
        print("Falha")
    }
    
    
}

