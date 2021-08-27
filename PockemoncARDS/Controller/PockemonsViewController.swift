//
//  ViewController.swift
//  PockemoncARDS
//
//  Created by elina.peiseniece on 06/08/2021.
//

import UIKit

class PokemonsViewController: UIViewController {

    @IBOutlet weak var tableViewController: UITableView!
    var poky: [Pokemon] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Pokemon List"
        getPokemonData()
    }
    
    func getPokemonData(){
        let url = URL(string: "https://api.pokemontcg.io/v1/cards")!
        
        NetworkController.performRequest(for: url, httpMethod: .get){(data, err) in
            if let error = err {
                print(" getting error from \(url.absoluteString), err: \(error.localizedDescription)" )
            }
            
            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(Cards.self, from: data)
                    self.poky = jsonData.cards
                }catch{
                    print(" Failed to create Pokemon data \(error), data: \(String(describing: err))")
                }
                DispatchQueue.main.async {
                    self.tableViewController.reloadData()
                }
            
            } else{
                print("Data is nil")
            }
        }
        
    }
    
}




extension PokemonsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poky.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as? PokyTableViewCell else {
            return UITableViewCell()
        }
        
        let poke = poky[indexPath.row]
        cell.setupUI(with: poke
        
        )
        return cell
    }
    
    
}

