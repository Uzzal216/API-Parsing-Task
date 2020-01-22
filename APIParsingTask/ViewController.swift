//
//  ViewController.swift
//  APIParsingTask
//
//  Created by U.M. Hamidul islam on 1/21/20.
//  Copyright © 2020 U.M. Hamidul islam. All rights reserved.
//

import UIKit
struct Country: Decodable  {
    
    let name: String
    let capital: String
    let region: String
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://restcountries.eu/rest/v2/all"
        let ulrObj = URL (string: url)
        URLSession.shared.dataTask(with: ulrObj!) {(data, responds, error) in
            do {
                var countries = try JSONDecoder().decode([Country].self, from:
                    data!)
                for country in countries {
                    print(country.name + " : " + country.capital)
                }
                
            } catch{
                print("we got an error")
                
            }
        }.resume()
        
    }


}

