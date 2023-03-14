//
//  ViewController.swift
//  Randomizer
//
//  Created by Ilya Zemskov on 10.03.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func setNewValue(for randomNumber: RandomNumber)
}

final class MainViewController: UIViewController {

    @IBOutlet var minimumValueLabel: UILabel!
    @IBOutlet var maximumValueLabel: UILabel!
    @IBOutlet var randomValueLabel: UILabel!
    
    @IBOutlet var getRandomNumberButton: UIButton!
    
    private var randomNumber = RandomNumber(minimumValue: 0, maximumValue: 100) {
        didSet {
            minimumValueLabel.text = randomNumber.minimumValue.formatted()
            maximumValueLabel.text = randomNumber.maximumValue.formatted()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRandomNumberButton.layer.cornerRadius = 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingsVC = navigationVC.topViewController as? SettingsViewController else { return }
        settingsVC.randomNumber = randomNumber
        settingsVC.delegate = self
    }
    
    @IBAction func getRandomButtonWasTappad() {
        randomValueLabel.text = randomNumber.getRandom.formatted()
    }
}

// MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
    func setNewValue(for randomNumber: RandomNumber) {
        self.randomNumber = randomNumber
    }
}
