import Foundation

struct ShiftCipher: Cipher {
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        let temp = plaintext.count - Int(shiftBy)
        
        let pretext = plaintext.prefix(Int(shiftBy))
        let suftext = plaintext	.suffix(temp)
        encoded = String(suftext + pretext)
        return encoded
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var decrypted = ""
        let temp = plaintext.count - Int(shiftBy)
        let suftext = plaintext.suffix(Int(shiftBy))
        let pretext = plaintext.prefix(temp)
        decrypted = String(suftext + pretext)
        return decrypted
    }
}
