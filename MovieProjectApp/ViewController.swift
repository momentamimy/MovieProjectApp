//
//  ViewController.swift
//  MovieProjectApp
//
//  Created by Mostafa Samir on 1/5/20.
//  Copyright © 2020 momen. All rights reserved.
//

import UIKit
import RevealingSplashView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Initialize a revealing Splash with with the iconImage, the initial size and the background color
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "house")!, iconInitialSize: CGSize(width: 195, height: 195), backgroundColor: UIColor(red:14/255, green:152/255, blue:1, alpha:1.0))
        
        revealingSplashView.useCustomIconColor = true
        //revealingSplashView.iconColor = UIColor.red
        
        //Adds the revealing splash view as a sub view
        self.view.addSubview(revealingSplashView)
        
        //Starts animation
        revealingSplashView.startAnimation(){
            print("Completed")
            print(" Online ")
            let url = URL(string: "http://api.themoviedb.org/3/discover/movie?api_key=96aa567cb117a960917f40e63085a71e")
            let request = URLRequest(url: url!)
            let sestion = URLSession(configuration: URLSessionConfiguration.default)
            
            let task = sestion.dataTask(with: request) { (data, res, err) in
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary <String , Any>
                    print("respo___:  \(json["results"])")
                    
                } catch {
                    print("ERROR \(error.localizedDescription)")
                }
            }
            task.resume()

        }
    }
}

