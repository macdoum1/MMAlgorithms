// WIP: Nearby words via keyboard adjacency — educational / partial implementation.

extension String {
    /// Returns dictionary words formed by substituting one character with an adjacent key.
    public func nearbyWords() -> [String] {
        var result: [String] = []
        let chars = Array(self)
        for (i, char) in chars.enumerated() {
            for nearby in nearbyCharacters(for: char) {
                var modified = chars
                modified[i] = nearby
                let candidate = String(modified)
                if isDictionaryWord(candidate) {
                    result.append(candidate)
                }
            }
        }
        return result
    }

    // Note: partial keyboard-adjacency map for learning purposes only.
    private func nearbyCharacters(for character: Character) -> [Character] {
        switch character {
        case "g": return ["h", "j", "f"]
        case "i": return ["u", "k", "o"]
        default:  return []
        }
    }

    private func isDictionaryWord(_ word: String) -> Bool {
        word.isInDictionary
    }
}
