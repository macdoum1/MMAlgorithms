extension String {
    /// Returns dictionary words formed by substituting exactly one character
    /// with an adjacent key on a standard QWERTY keyboard.
    public func nearbyWords() -> [String] {
        var result: [String] = []
        let chars = Array(self)
        for (i, char) in chars.enumerated() {
            for nearby in nearbyCharacters(for: char) {
                var modified = chars
                modified[i] = nearby
                let candidate = String(modified)
                if candidate.isInDictionary {
                    result.append(candidate)
                }
            }
        }
        return result
    }

    // Full QWERTY keyboard adjacency map (horizontal and diagonal neighbors).
    private func nearbyCharacters(for character: Character) -> [Character] {
        switch character {
        case "q": return ["w", "a", "s"]
        case "w": return ["q", "e", "a", "s", "d"]
        case "e": return ["w", "r", "s", "d", "f"]
        case "r": return ["e", "t", "d", "f", "g"]
        case "t": return ["r", "y", "f", "g", "h"]
        case "y": return ["t", "u", "g", "h", "j"]
        case "u": return ["y", "i", "h", "j", "k"]
        case "i": return ["u", "o", "j", "k", "l"]
        case "o": return ["i", "p", "k", "l"]
        case "p": return ["o", "l"]
        case "a": return ["q", "w", "s", "z"]
        case "s": return ["a", "w", "e", "d", "z", "x"]
        case "d": return ["s", "e", "r", "f", "x", "c"]
        case "f": return ["d", "r", "t", "g", "c", "v"]
        case "g": return ["f", "t", "y", "h", "v", "b"]
        case "h": return ["g", "y", "u", "j", "b", "n"]
        case "j": return ["h", "u", "i", "k", "n", "m"]
        case "k": return ["j", "i", "o", "l", "m"]
        case "l": return ["k", "o", "p"]
        case "z": return ["a", "s", "x"]
        case "x": return ["z", "s", "d", "c"]
        case "c": return ["x", "d", "f", "v"]
        case "v": return ["c", "f", "g", "b"]
        case "b": return ["v", "g", "h", "n"]
        case "n": return ["b", "h", "j", "m"]
        case "m": return ["n", "j", "k"]
        default:  return []
        }
    }
}
