//
//  ViewController.swift
//  Randomiser2
//
//  Created by Алиага С on 23.6.2022.
//

import UIKit

protocol SettingsVCProtocol {
    func setNewValues(for randomNumber: RandomNumber)
}

class RandomisViewController: UIViewController {
    
    @IBOutlet var minimumValueLabel: UILabel!
    @IBOutlet var maximumValueLabel: UILabel!
    @IBOutlet var randomValueLabel: UILabel!
    @IBOutlet var getRandomNumberButton: UIButton!
    
    private var randomNumber = RandomNumber(minimumValue: 0, maximumValue: 100)

    override func viewDidLoad() {
        super.viewDidLoad()
        getRandomNumberButton.layer.cornerRadius = 10
        minimumValueLabel.text = String(randomNumber.minimumValue)
        maximumValueLabel.text = String(randomNumber.maximumValue)
 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingsVC = navigationVC.topViewController as? SettingsViewController else { return }
        settingsVC.randomNumber = randomNumber
        settingsVC.delegate = self
    }
    
    @IBAction func getRandomNumberButtonTapped() {
        randomValueLabel.text = String(randomNumber.getRandom)
    }
}


extension RandomisViewController: SettingsVCProtocol {
    func setNewValues(for randomNumber: RandomNumber) {
        minimumValueLabel.text = String(randomNumber.minimumValue)
        maximumValueLabel.text = String(randomNumber.maximumValue)
        self.randomNumber = randomNumber
    }
    
}


