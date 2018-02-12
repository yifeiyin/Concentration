//
//  ViewController.swift
//  Concentration
//
//  Created by YinYifei on 2018-02-11.
//  Copyright © 2018 Yifei Yin. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    lazy var game = Concentration(numberOfPairsOfCards: cardButtons.count / 2)
    
    @IBOutlet var cardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateViewFromModel()
    }
    
    @IBAction func NewGame(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: cardButtons.count / 2)
        UpdateViewFromModel()
    }
    
    
    @IBAction func TouchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.ChooseCard(at: cardNumber)
            UpdateViewFromModel()
        } else {
            print("error")
        }
    }
    

    
    func UpdateViewFromModel() {
        for index in 0..<cardButtons.count {
            if game.cards[index].isHidden {
                cardButtons[index].backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0)
                cardButtons[index].setTitle("", for: UIControlState.normal)
                continue
            }
            
            if game.cards[index].isFaceUp {
                cardButtons[index].backgroundColor = GetBackgroundColor(for: game.cards[index].identifier)
                cardButtons[index].setTitle(GetEmoji(for: game.cards[index].identifier), for: UIControlState.normal)
            } else  {
                cardButtons[index].backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
                cardButtons[index].setTitle("", for: UIControlState.normal)
            }
        }
    }
    
    var emojiPool = ["🐶", "🐱", "🐭", "🐹",
                     "🐰", "🦊", "🐻", "🐼",
                     "🐨", "🐯", "🦁", "🐷",
                     "🐔", "🐧", "🐦", "🐤"]
    var emojiDictionary = [Int:String]()
    
    var colorPool = [#colorLiteral(red: 0.9063002467, green: 0.8908270001, blue: 0.8531067967, alpha: 1), #colorLiteral(red: 0.8990549445, green: 0.8593534231, blue: 0.8214295506, alpha: 1), #colorLiteral(red: 0.613171041, green: 0.7072283626, blue: 0.6495981812, alpha: 1), #colorLiteral(red: 0.6960077882, green: 0.7692305446, blue: 0.7529992461, alpha: 1),
                     #colorLiteral(red: 0.5184793472, green: 0.4913079143, blue: 0.4159127772, alpha: 1), #colorLiteral(red: 0.5210893154, green: 0.5555939674, blue: 0.3800052404, alpha: 1), #colorLiteral(red: 0.9944190383, green: 0.9206332564, blue: 0.7022240758, alpha: 1), #colorLiteral(red: 0.9848250747, green: 0.8199167848, blue: 0.4173446894, alpha: 1),
                     #colorLiteral(red: 0.5593286753, green: 0.4645781517, blue: 0.3035108745, alpha: 1), #colorLiteral(red: 0.2585485578, green: 0.2801941037, blue: 0.1542107463, alpha: 1), #colorLiteral(red: 0.8918181062, green: 0.8280803561, blue: 0.7774376869, alpha: 1), #colorLiteral(red: 0.7496557832, green: 0.7488467097, blue: 0.4756543636, alpha: 1),
                     #colorLiteral(red: 0.7895166278, green: 0.7512097359, blue: 0.6003804207, alpha: 1), #colorLiteral(red: 0.9606629014, green: 0.8098271489, blue: 0.6365234256, alpha: 1), #colorLiteral(red: 0.856805861, green: 0.9255086184, blue: 0.9424338937, alpha: 1), #colorLiteral(red: 0.7158928514, green: 0.898270309, blue: 0.9241618514, alpha: 1),]
    var colorDictionary = [Int:UIColor]()
    
    func GetEmoji(for index: Int) -> String {
        if emojiDictionary[index] == nil {
            emojiDictionary[index] = emojiPool.remove(at: Int(arc4random_uniform(UInt32(emojiPool.count))))
        }
        return emojiDictionary[index] ?? "?"
    }
    
    func GetBackgroundColor(for index: Int) -> UIColor {
        if colorDictionary[index] == nil {
            colorDictionary[index] = colorPool.remove(at: Int(arc4random_uniform(UInt32(colorPool.count))))
        }
        if colorDictionary[index] == nil {
            print("error: running out of color")
        }
        return colorDictionary[index] ?? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}

