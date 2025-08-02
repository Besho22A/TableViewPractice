//
//  ViewController.swift
//  TableViewPractice
//
//  Created by Beshoy Atef on 02/08/2025.
//

import UIKit

class CountriesViewController: UIViewController {

    @IBOutlet var countriesTableView: UITableView!
    
    var countries = ["Egypt","USA","UAE","France","Germen","Brazil"]
    
    var flags = [UIImage(named: "Egypt"),UIImage(named: "USA"),UIImage(named: "UAE"),UIImage(named: "France"),UIImage(named: "German"),UIImage(named: "Brazil")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countriesTableView.dataSource = self
        countriesTableView.delegate = self
    }
}
extension CountriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as? CountryTableViewCell {
            cell.countryNameLabel.text = " \(indexPath.row + 1):- \(countries[indexPath.row])"
            cell.countyFlagImage.image = flags[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}

extension CountriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailsPopUp = storyboard?.instantiateViewController(identifier: "CountryPopUpDetailsVC") as? CountryPopUpDetailsVC {
            detailsPopUp.flag = flags[indexPath.row]
            detailsPopUp.name = countries[indexPath.row]
            present(detailsPopUp, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        countries.remove(at: indexPath.row)
        flags.remove(at: indexPath.row)
        countriesTableView.reloadData()
    }
}
