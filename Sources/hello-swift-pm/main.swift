import Commander

enum Greeting {
    enum ParseError: Error, CustomStringConvertible {
        case invalidTime

        var description: String {
            switch self {
            case .invalidTime:
                return "Invalid time option"
            }
        }
    }

    static func validator(time: String) throws -> String {
        switch time {
        case "morning": return "Good morning, "
        case "evening": return "Good evening, "
        default: throw ParseError.invalidTime
        }
    }
}

let main = command(
    Option("name", default: "SwiftPM"),
    Option("time", default: "daytime", description: "morning or evening", validator: Greeting.validator)
) { name, time in
    let greeting = time == "daytime" ? "Hello, " : time
    print(greeting + name + "!")
}

main.run()
