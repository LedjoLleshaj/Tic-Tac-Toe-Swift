//
//  ViewController.swift
//  VR450678_LEDJO_LLESHAJ
//
//  Created by Ledjo Lleshaj on 26/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    var name1:String!
    var name2:String!
    
    @IBOutlet weak var firstPlayer: UILabel!
    @IBOutlet weak var winsFirstPlayer: UILabel!

    @IBOutlet weak var secondPlayer: UILabel!
    @IBOutlet weak var winsSecondPlayer: UILabel!
    
    //indica il turno
    @IBOutlet weak var turnoLabel: UILabel!
    var player1 = "X"
    var player2 = "O"
    var currentTurn = "X"
    var count = 0
    //conta i risultati di ciascun player
    var firstPlayerScore = 0
    var secondPlayerScore = 0
     //le coordinate
    @IBOutlet weak var a11: UIButton!
    @IBOutlet weak var a12: UIButton!
    @IBOutlet weak var a13: UIButton!
    @IBOutlet weak var a21: UIButton!
    @IBOutlet weak var a22: UIButton!
    @IBOutlet weak var a23: UIButton!
    @IBOutlet weak var a31: UIButton!
    @IBOutlet weak var a32: UIButton!
    @IBOutlet weak var a33: UIButton!
    //a11.titleLabel?.font = UIFont.boldSystemFont(ofSize: 90)
    //a12.titleLabel?.font = UIFont(name: "HelveticaNeue-UltraLight", size: 90)
    //prima volta che inizia il gioco pulisco i buttoni
    var gameStarted = true
        //import names from start view
    override func viewDidLoad() {
        super.viewDidLoad()
        if !name1.isEmpty{
            firstPlayer.text = name1
        }
        else{//if name empty scelgo io il nome :P
            firstPlayer.text = "Elon Musk"
        }
        if !name2.isEmpty{
            secondPlayer.text = name2
        }
        else{
            secondPlayer.text = "Steve Jobs"
        }
        //per le prossime volte viene pulito dal funzione restart game
        if(gameStarted == true){
            restartBoard()
            gameStarted = false
        }

    }


    @IBAction func clickEvent(_ sender: UIButton) {
        addSymbol(sender)
        //controllo per player X
        if checkGame("X"){
            risultato(title: firstPlayer.text ?? "First player won" )
            firstPlayerScore += 1
        }//controllo per player O
        if checkGame("O"){
            risultato(title: secondPlayer.text ?? "Second player won" + " won")
            secondPlayerScore += 1
        }
        //aggiorno risultati
        winsFirstPlayer.text = String(firstPlayerScore)
        winsSecondPlayer.text = String(secondPlayerScore)
        //se tutte le coordinate sono piene allora Draw
        if count == 9 {
            risultato(title: "Draw")
        }

    }
    //controllo tutti i pattern possibili se uno dei player ha vinto
    func checkGame(_ s : String) -> Bool {
        if checkWinSimbolo(a11, s) && checkWinSimbolo(a12, s) && checkWinSimbolo(a13, s){
            return true
        }
        if checkWinSimbolo(a21, s) && checkWinSimbolo(a22, s) && checkWinSimbolo(a23, s){
            return true
        }
        if checkWinSimbolo(a31, s) && checkWinSimbolo(a32, s) && checkWinSimbolo(a33, s){
            return true
        }
        if checkWinSimbolo(a12, s) && checkWinSimbolo(a22, s) && checkWinSimbolo(a32, s){
            return true
        }
        if checkWinSimbolo(a13, s) && checkWinSimbolo(a23, s) && checkWinSimbolo(a33, s){
            return true
        }
        if checkWinSimbolo(a11, s) && checkWinSimbolo(a21, s) && checkWinSimbolo(a31, s){
            return true
        }
        if checkWinSimbolo(a11, s) && checkWinSimbolo(a22, s) && checkWinSimbolo(a33, s){
            return true
        }
        if checkWinSimbolo(a31, s) && checkWinSimbolo(a22, s) && checkWinSimbolo(a13, s){
            return true
        }
        
        return false
    }
    
    func checkWinSimbolo(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }
    func risultato(title: String){
        //pulisco i titoli quando inizio il prossimo gioco
        a11.setTitle(" ", for: .normal)
        a12.setTitle(" ", for: .normal)
        a13.setTitle(" ", for: .normal)
        a21.setTitle(" ", for: .normal)
        a22.setTitle(" ", for: .normal)
        a23.setTitle(" ", for: .normal)
        a31.setTitle(" ", for: .normal)
        a32.setTitle(" ", for: .normal)
        a33.setTitle(" ", for: .normal)
        //mostro un picolo notifica se il gioco ha finito
        let vk = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        vk.addAction(UIAlertAction(title: "Restart", style: .default, handler: {(_) in self.restartBoard()
        }))
        self.present(vk, animated: true)
    }
    
    func restartBoard(){
        
        //rissetto tutti i buttoni nello stato iniziale (vuoto)
        a11.setTitle(nil, for: .normal)
        a11.isEnabled = true
        a12.setTitle(nil, for: .normal)
        a12.isEnabled = true
        a13.setTitle(nil, for: .normal)
        a13.isEnabled = true
        a21.setTitle(nil, for: .normal)
        a21.isEnabled = true
        a22.setTitle(nil, for: .normal)
        a22.isEnabled = true
        a23.setTitle(nil, for: .normal)
        a23.isEnabled = true
        a31.setTitle(nil, for: .normal)
        a31.isEnabled = true
        a32.setTitle(nil, for: .normal)
        a32.isEnabled = true
        a33.setTitle(nil, for: .normal)
        a33.isEnabled = true
        currentTurn = "X"
        count = 0
        
    }
    //per ogni turno metto i simboli X/O nelle button
    func addSymbol(_ sender: UIButton){
        
        if(sender.title(for: .normal) == nil){
            if(currentTurn == player1){
                sender.setTitle(player1, for: .normal)
                //sender.titleLabel!.font = UIFont(name: "Helvetica", size: 40)
                //sender.titleLabel?.font = UIFont.boldSystemFont(ofSize: 90)
                currentTurn = player2
                turnoLabel.text = player2
                count += 1
            }
            else if(currentTurn == player2){
                sender.setTitle(player2, for: .normal)
               // sender.titleLabel?.font = UIFont(name: "HelveticaNeue-UltraLight", size: 90)
                currentTurn = player1
                turnoLabel.text = player1
                count += 1
            }
            sender.isEnabled = false
        }
    }
    
}

