import Foundation

struct AlphanumericCesarCipher: Cipher {
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        
        for character in plaintext {
            var unicode = character.unicodeScalars.first!.value
            var shiftedCharacter = ""
            if unicode >= 97 && unicode <= 122 {
                unicode = unicode - 32
            }
            if (unicode >= 65 && unicode <= 90) || (unicode >= 48 && unicode <= 57) {
                var shiftedUnicode = unicode + shiftBy
                if shiftedUnicode > 90 {
                    let temp = shiftedUnicode - 90
                    shiftedUnicode = 47 + temp
                    shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                } else if shiftedUnicode > 57 && unicode <= 57 {
                    let temp = shiftedUnicode - 57
                    shiftedUnicode = 64 + temp
                    shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    
                }else {
                    shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                }
                encoded = encoded + shiftedCharacter
            } else {
                encoded = "Please Enter characters from A-Z, 0-9"
            }
        }
        return encoded
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        
        var decrypted = ""
        
        for character in plaintext {
            var unicode = character.unicodeScalars.first!.value
            if unicode >= 97 && unicode <= 122 {
                unicode = unicode - 32
            }
            var shiftedCharacter = ""
            if (unicode >= 65 && unicode <= 90) || (unicode >= 48 && unicode <= 57) {
                var shiftedUnicode = unicode - shiftBy
                if shiftedUnicode < 48 {
                    let temp = 47 - shiftedUnicode
                    shiftedUnicode = 90 - temp
                    shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                } else if shiftedUnicode < 65 && unicode >= 65 {
                    let temp = 64 - shiftedUnicode
                    shiftedUnicode = 57 - temp
                    shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    
                }else {
                    shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                }
                decrypted = decrypted + shiftedCharacter
            }else {
                decrypted = "Please Enter characters from A-Z, 0-9"
            }
        }
        return decrypted
    }
}
