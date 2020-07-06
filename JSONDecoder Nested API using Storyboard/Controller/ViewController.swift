//
//  ViewController.swift
//  JSONDecoder Nested API using Storyboard
//
//  Created by Md Khaled Hasan Manna on 6/7/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- Properties
    var users = [User]()
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Initializers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        JSONHandler()
        
    }
    
    
    
    //MARK:- Handlers
    func JSONHandler(){
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else{return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data ,error == nil else{
                print(error!.localizedDescription)
                return
            }
            
            do{
                self.users = try JSONDecoder().decode([User].self, from: data)
                
                for result in self.users {
                    print(result.address.geo.latitude ?? "n/a")
                }
                
            }catch let persingError {
                print(persingError)
            }
            
            
            
            
            
        }
        task.resume()
        
        
        
    }


}

