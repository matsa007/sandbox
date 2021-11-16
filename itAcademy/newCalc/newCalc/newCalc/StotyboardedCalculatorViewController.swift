import UIKit

/*enum BinaryOperand: Int {
    case multiply = 100 // умножить
    case divide = 101 // поделить
    case sum = 102 // сложить
    case substruct = 103 // вычесть
}

enum UnaryOperand: Int {
    case percent = 201
    case invert = 202
}

class StoryboardedCalculatorViewController: UIViewController {
    
    static let initialValue: Double = 0
    static let maxAllowedDigits: Int = 9
    static let initialValueString = convertToString(initialValue)
    
    @IBOutlet weak var displayLabel: UILabel!
   
    var displayText: String = StoryboardedCalculatorViewController.initialValueString {
        didSet {
            displayLabel.text = displayText
        }
    }
    
    var value1: Double = 0
    var value2: Double?
    var selectedBinaryOperand: BinaryOperand?
    
    didSet {
        if let oldValue = oldValue {
            if let selectedButton = view.viewWithTag(oldValue.rawValue) as?
                UIButton {
                selectedButton.isSelected = false
            }
        }
    }
    
    var needToRestartTextLabel = false
    
    static let formatter: NumberFormatter = {
       let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.decimalSeparator = Locale.current.decimalSeparator
        
        return formatter
    }()
    
    // MARK: - override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup() {
        displayText = Self.initialValueString
    }
    
    // MARK: - IBActions
    
    @IBAction func digitButtonTapped(_ digitButton: UIButton) {
        updateDisplayText(with: String(digitButton.tag))
    }
    
    @IBAction func binaryOperandButtonTapped(_ sender: UIButton) {
        guard let binaryOperand = BinaryOperand(rawValue: sender.tag) else {
            print("unknown operand")
            return
        }
        
        if let value2 = value2 {
            selectedBinaryOperand = nil
            let result = Self.calculate(value1: value1, value2: value2, binaryOperand: binaryOperand)
            displayText = Self.convertToString(result)
            self.value2 = nil
            self.value1 = result
        }
        
        selectedBinaryOperand = binaryOperand
        needToRestartTextLabel = true
    }
    
    @IBAction func unaryOperatorButtonTapped(_ sender: UIButton) {
        guard let unaryOperand = UnaryOperand(rawValue: sender.tag) else {
            print("unknown operand")
            return
        }
        
        let displayNumberValue = Self.convertToDouble(displayText)
        let result = Self.calculate(displayNumberValue, unaryOperand: unaryOperand)
        displayText = Self.convertToString(result)
        
        if selectedBinaryOperand == nil {
            value1 = result
        } else {
            value2 = result
        }
    }
    
    @IBAction func equalOperatorButtonTapped(_ sender: Any) {
        if let selectedBinaryOperand = selectedBinaryOperand {
            let result: Double
            if let value2 = value2 {
                result = Self.calculate(value1: value1, value2: value2, binaryOperand: selectedBinaryOperand)
                
            } else {
                result = Self.calculate(value1: value1, value2: value1, binaryOperand: selectedBinaryOperand)
            }
            
            displayText = Self.convertToString(result)
            self.value1 = result
        }
    }
    
    @IBAction func decimalSeparatorButtonTapped(_ sender: Any) {
        updateDisplayText(with: Self.formatter.decimalSeparator)
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        displayText = Self.initialValueString
        
        if value2 != nil {
            value2 = nil
        } else {
            value1 = Self.initialValue
            selectedBinaryOperand = nil
        }
    }
    
    // MARK: - Functions
    
    func updateDisplayText(with newText: String) {
        let displayTextNumberValue = Self.convertToDouble(displayText)
        let newTextNumberValue = Self.convertToDouble(newText)
        
        if displayTextNumberValue == Self.initialValue && !displayText.contains(Self.formatter.decimalSeparator) {
            var newDisplaytext = newText
            if newTextNumberValue == Self.initialValue {
                if newText != Self.formatter.decimalSeparator {
                    return
                } else {
                    newDisplaytext = displayText + newText
                }
            }
            
            displayText = newDisplaytext
        } else {
            if needToRestartTextLabel {
                displayText = (newText == Self.formatter.decimalSeparator) ? Self.initialValueString + newText : newText
                needToRestartTextLabel = false
            } else {
                if displayText.count <= Self.maxAllowedDigits && !(displayText.contains(Self.formatter.decimalSeparator) && newText == Self.formatter.decimalSeparator) {
                    displayText += newText
                }
            }
        }
        
        let updatedDisplayTextNumberValue = Self.convertToDouble(displayText)
        if selectedBinaryOperand == nil {
            value1 = updatedDisplayTextNumberValue
        } else {
            value2 = updatedDisplayTextNumberValue
        }
    }
    
    // MARK: - Claculator logic
    
    static func calculate(value1: Double, value2: Double, binaryOperand: BinaryOperand) -> Double {
        
        switch binaryOperand {
        case .multiply:
            return value1 * value2
        case .divide:
            return value1 / value2
        case .sum:
            return value1 + value2
        case .substruct:
            return value1 - value2
       }
    }
    
    static func calculate(_ value: Double, unaryOperand: UnaryOperand) -> Double {
        
        var result: Double = value
        switch unaryOperand {
        case .percent:
            result = value / 100
        case .invert:
            result.negate()
        }
        
        return result
    }
    
    static func convertToDouble(_ value: String) -> Double {
        return formatter.number(from: value)?.doubleValue ?? initialValue
    }
    
    static func convertToString(_ value: Double) -> String {
        return formatter.string(from: NSNumber(value: value)) ?? String(value)
    }
}

*/
class StoryboardedCalculatorViewController: AbstractCalculatorViewController {
    
}
