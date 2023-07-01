//
//  ViewController.swift
//  Card
//
//  Created by Jing Han on 2023/3/10.
//

import UIKit

class ViewController:
    UIViewController {
    
    
    
    @IBOutlet var CardButtons: [UIButton]!
    
    var emojiChoices = ["🌏","🌚","🥝","🎱","🌝","🤡","😈","🍎"]
    var emoji = Dictionary<Card, String>()
    
    var numberOfPairOfCard:Int{
        return (CardButtons.count+1)/2
    }
    lazy var game:MatchingGame = MatchingGame(numberOfPairOfCards: numberOfPairOfCard)
    
    let font = UIFont.systemFont(ofSize: 50)
    lazy var buttonAttribute = [NSAttributedString.Key.font: font]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var flip_count_label: UILabel!
    
    
    // control + drag = connect to @IBAction func
    @IBAction func touch(_ sender: UIButton) {
        if !game.FlipAll{
            if let index = CardButtons.firstIndex(of: sender){
                _ = game.chooseCard(at: index)
                flip_count_label.attributedText = game.UpdateFlipCountLabel()
                updateViewModel()
            }else{
                print("not in collection!")
            }
        }
    }
    
    @IBAction func ResetAction(_ sender: UIButton) {
        game.FlipAll = false
        for index in CardButtons.indices{
            game.cards[index].isMatched = false
            game.cards[index].isFaceUp = false
            game.indexOfOneAndOnlyFaceUpCard = nil
        }
        game.flipcount = 0
        flip_count_label.attributedText = game.UpdateFlipCountLabel()
        game.cards.shuffle()
        updateViewModel()
        
        
    }
    
    
    @IBAction func FilpAll(_ sender: UIButton) {
        game.FlipAll = !game.FlipAll
        for index in CardButtons.indices{
            game.flipcount = 0
            game.cards[index].isMatched = false
            game.cards[index].isFaceUp = !game.cards[index].isFaceUp
            updateViewModel()
            flip_count_label.attributedText = game.UpdateFlipCountLabel()
        }
    }
    
    
    // =====================
    func updateViewModel() {
        for index in CardButtons.indices{
            let button = CardButtons[index]
            let card = game.cards[index]
            if !card.isFaceUp{
                let message = NSAttributedString(string: "", attributes: buttonAttribute)
                let frontcolor = #colorLiteral(red: 0.8863865733, green: 0.7263936996, blue: 0.4666878581, alpha: 1)
                button.backgroundColor = frontcolor
                button.setAttributedTitle(message, for: UIControl.State.normal)
            }else{
                let message = NSAttributedString(string: getEmoji(for: card), attributes: buttonAttribute)
                let bgcolor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                if !card.isMatched{
                    button.backgroundColor = bgcolor
                }else{
                    button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
                }
                button.setAttributedTitle(message, for: UIControl.State.normal)
            }
        }
    }
    // =====================
    
    // =====================
    func getEmoji(for card: Card)->String{
        if emoji[card] == nil, emojiChoices.count>0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card] ?? "?"
    }
    
}


