import Foundation

struct DoubleCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        guard var shiftBy = UInt32(secret) else {
            return nil
        }
        shiftBy = shiftBy * 2
        var encoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String? {
        guard var shiftBy = UInt32(secret) else {
            return nil
        }
        var decrypted = ""
        shiftBy = shiftBy * 2
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decrypted = decrypted + shiftedCharacter
        }
        return decrypted
    }
}
