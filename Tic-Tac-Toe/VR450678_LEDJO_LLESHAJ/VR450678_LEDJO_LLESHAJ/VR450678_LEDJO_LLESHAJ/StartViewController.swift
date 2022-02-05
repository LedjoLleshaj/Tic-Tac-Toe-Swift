//
//  StartViewController.swift
//  VR450678_LEDJO_LLESHAJ
//
//  Created by Ledjo Lleshaj on 26/01/22.
//

import UIKit

class StartViewController: UIViewController {

    
    @IBOutlet weak var player1: UITextField!
    @IBOutlet weak var player2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //apro la seconda view e trasferisco i nomi del player 1 e 2
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ViewController{
            controller.name1 = player1.text
            controller.name2 = player2.text
            controller.modalPresentationStyle = .fullScreen
        }
    }

}
