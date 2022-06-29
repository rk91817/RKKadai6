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

    private var correctAnswer = 0

    @IBAction func didTapButton(_ sender: Any) {
        let sliderValue: Int = Int(slider.value)
        if sliderValue == correctAnswer {
            presentAlert(message: "あたり！\nあなたの値: \(sliderValue)")
        } else {
            presentAlert(message: "はずれ！\nあなたの値: \(sliderValue)")
        }
    }

    private func randomNum () -> Int {
        Int.random(in: 1...100)
    }

    private func presentAlert(message: String) {
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "再挑戦", style: .default, handler: { _ in
            self.resetGame()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
    }

    private func resetGame() {
        correctAnswer = randomNum()
        randomIntLabel.text = String(correctAnswer)
        slider.value = 50
    }
}
