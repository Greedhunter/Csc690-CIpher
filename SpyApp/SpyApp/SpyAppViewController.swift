import UIKit

class SpyAppViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var secret: UITextField!
    @IBOutlet weak var output: UILabel!

    let factory = CipherFactory()
    var cipher: Cipher?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.input.delegate = self;
    }
    func textField(_ textField: UITextField, shouldChangeCharacterIn range: NSRange, replacementString string: String) -> Bool{
        let allowedCharacters = CharacterSet.alphanumerics
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }

    var plaintext: String {
       
        if let text = input.text {
            
            return text
        } else {
            return ""
        }
    }

    var secretText: String {
        if let text = secret.text {
            return text
        } else {
            return ""
        }
    }

    @IBAction func encodeButtonPressed(_ sender: UIButton) {
        guard let cipher = self.cipher else {
            output.text = "No cipher selected"
            return
        }
        if let encoded = cipher.encode(plaintext, secret: secretText) {
            output.text = encoded
        } else {
            output.text = "Error encoding"
        }
    }
    
    @IBAction func decryptButtonPresssed(_ sender: UIButton) {
        guard let cipher = self.cipher else {
            output.text = "No cipher selected"
            return
        }
        if let decrypted = cipher.decrypt(plaintext, secret: secretText) {
            output.text = decrypted
        } else {
            output.text = "Error decrypting"
        }
    }
    

    @IBAction func cipherButtonPressed(_ sender: UIButton) {
        guard
            let buttonLable = sender.titleLabel,
            let buttonText = buttonLable.text
        else {
            output.text = "No button or no button text"
            return
        }
        cipher = factory.cipher(for: buttonText)
    }
}

