import Foundation


struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "Alphanumeric": AlphanumericCesarCipher(),
        "Shift": ShiftCipher(),
        "Double": DoubleCipher()
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
    
    
}
