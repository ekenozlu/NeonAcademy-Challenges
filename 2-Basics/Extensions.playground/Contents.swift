import UIKit

//Creating an extension for String that would allow the citizens to easily check if a string was a palindrome, a word or phrase that reads the same forwards as backwards.
extension String {
    func checkForPalindome() -> Bool {
        var reversed = String(self.replacingOccurrences(of: " ", with: "").lowercased().reversed())
        if self == reversed {
            return true
        }
        return false
    }
}

let palindome = "tenet"
let notPalindome = "neon apps"
palindome.checkForPalindome()
notPalindome.checkForPalindome()

//Int extension that would determine if a number was prime.

extension Int {
    func checkForPrime() -> Bool {
        for divider in 2...self-1 {
            if self % divider == 0 {
                return false
            }
        }
        return true
    }
}

let primeNumber = 13
let notPrimeNumber = 6
primeNumber.checkForPrime()
notPrimeNumber.checkForPrime()

//The Bool extension was not left behind, they added a function that could easily invert a boolean value, allowing the citizens to quickly switch between true and false, making their lives more efficient.

extension Bool {
    func toggleFromNewExtension() -> Bool{
        return !(self)
    }
}

var boolWillChange = false
boolWillChange.toggleFromNewExtension()

//Creating an extension for Date that would allow the citizens to calculate the number of days between two dates, making it much easier for them to plan events and keep track of important dates.

extension Date {
    func calculateDaysBetween(_ date2 : Date) -> Int{
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: self, to: date2)
        return components.day ?? 0
    }
}

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd-MM-yyyy"

if let date1 = dateFormatter.date(from: "01-01-2023"), let date2 = dateFormatter.date(from: "31-12-2023") {let daysBetween = date1.calculateDaysBetween(date2)
    print("Number of days between the two dates: \(daysBetween)")
}


//For UIViewController, UILabel, UIImage, UIImageView and UIButton, They added a function to easily change the background color, text, and image respectively, making it much more convenient for the kingdom's designers and developers to create beautiful and engaging user interfaces.

extension UIViewController {
    func changeBackgroundColor(withColor color : UIColor){
        self.view.backgroundColor = color
    }
}

extension UILabel {
    func changeText(withNewText text :String) {
        self.text = text
    }
}

extension UIImage {
    //
}

extension UIImageView {
    func changeImage(withNewImage image : UIImage){
        self.image = image
    }
}

extension UIButton {
    func changeColorAndText(withColor color : UIColor, andText text : String){
        self.backgroundColor = color
        self.titleLabel?.text = text
    }
}






