//
//  ViewController.swift
//  RKKadai6
//
//  Created by kasai riku on 2022/06/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var randomIntLabel: UILabel!
    @IBOutlet private weak var slider: UISlider!
    
    @IBAction private func didTapButton(_ sender: Any) {
        slider.minimumValue = 1
        slider.maximumValue = 100
        let sliderValue: Int = Int(slider.value)
        let randomInt = Int(randomIntLabel.text ?? "0")
        if sliderValue == randomInt {
            presentAlert(message: "あたり！\nあなたの値: \(sliderValue)")
        } else {
            presentAlert(message: "はずれ！\nあなたの値: \(sliderValue)")
        }
    }
    
    private func randomNum () -> Int {
        let num = Int(1 + arc4random_uniform(100))
        return num
    }
    
    private func presentAlert(message: String) {
          let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "再挑戦", style: .default, handler: {_ in
            self.randomIntLabel.text = String(self.randomNum())
            self.slider.value = 50
        })
          alert.addAction(action)
          present(alert, animated: true, completion: nil)
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomIntLabel.text = String(randomNum())
    }
}
