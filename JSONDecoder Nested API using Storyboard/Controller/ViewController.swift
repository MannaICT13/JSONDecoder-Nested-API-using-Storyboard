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
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
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

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UserCell
      
        let user = users[indexPath.row]
        
        cell.nameLbl.text = user.name
        cell.cityLbl.text = user.address.city
        cell.latitideLbl.text = user.address.geo.latitude
        
        
        return cell
        
    }
    
    
    
    
    
}
