//
//  CountryPopUpDetailsVC.swift
//  TableViewPractice
//
//  Created by Beshoy Atef on 03/08/2025.
//

import UIKit

class CountryPopUpDetailsVC: UIViewController {

    var flag:UIImage?
    var name = ""
    
    @IBOutlet var flagImage: UIImageView!
    @IBOutlet var nameCountry: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flagImage.image = flag
        nameCountry.text = name
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissPopUp))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissPopUp(){
        dismiss(animated: true)
    }

}
