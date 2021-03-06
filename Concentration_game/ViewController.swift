//
//  ViewController.swift
//  Concentration_game
//
//  Created by Alexander Popov on 19.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var touchLabel: UILabel!
    @IBOutlet private var buttonCollection: [UIButton]!
    @IBAction private func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender){
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
      
    }
    
    private(set) var touches = 0 {
        didSet{
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    private lazy var game = ConcentrationGame(numberOfPairsOfCards: numberOfPairsOfCards)
    
    private var numberOfPairsOfCards: Int {
        return (buttonCollection.count+1)/2
    }
    
    private var emojiCollection = ["🐭","🐼","🐻","🐱","🦁","🐵","🥷","💩","👾","👨‍💻","🌚","⭐️","🏎","🚘","📱","👀","🧸","🐹","💰","🍰","🏀","🏆", "🎮","🧩","🎰", "🍟"]
    
    private var emojiDictionary = [Int: String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in buttonCollection{
            button.titleLabel?.font = .systemFont(ofSize: 50, weight: .medium)
            button.layer.cornerRadius = 0.5 * button.bounds.size.width
        }
    }

    private func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil {
            let randomIndex = Int.random(in: 0..<emojiCollection.count)
            emojiDictionary[card.identifier] = emojiCollection.remove(at: randomIndex)
        }
        return emojiDictionary[card.identifier] ?? "?"
    }
    
    private func updateViewFromModel(){
        for index in buttonCollection.indices{
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = UIColor(red: 0.87,green: 0.72, blue: 0.53, alpha: 1)
            }
            else {
                button.setTitle("", for: .normal)
                if card.isMatched{
                    button.setImage(UIImage(named: "doc.on.doc.fill"), for: .normal)
                }
                else{
                    button.backgroundColor = UIColor(red: 0.69, green: 0.77, blue: 0.87, alpha: 1)
                }
                
            }
        }
    }

}

