import UIKit

enum TeamType : String {
    case iOS = "iOS Development Team"
    case Android = "Android Development Team"
    case UI_UX = "UI/UX Design Team"
}

class NeonAcademyMember {
    private var fullName : String
    private var title : String
    private var horoscope : String
    private var memberLevel : Int?
    private var mentorLevel : Int?
    private var hometown : String
    private var age : Int
    private var contactInformation : ContactInformation
    private var team : TeamType
    private var motivationLevel : Int?
    
    init(fullName: String, title: String, horoscope: String, memberLevel: Int? = nil, mentorLevel: Int? = nil, hometown: String, age: Int, contactInformation: ContactInformation, team: TeamType, motivationLevel: Int? = nil) {
        self.fullName = fullName
        self.title = title
        self.horoscope = horoscope
        self.memberLevel = memberLevel
        self.mentorLevel = mentorLevel
        self.hometown = hometown
        self.age = age
        self.contactInformation = contactInformation
        self.team = team
        self.motivationLevel = motivationLevel
    }
    
    public func getFullName() -> String {
        return self.fullName
    }
    
    public func getTitle() -> String {
        return self.title
    }
    
    public func setTitle(_ title : String) {
        self.title = title
    }
    
    public func getHoroscope() -> String {
        return self.horoscope
    }
    
    public func getMemberOrMentorLevel() -> Int {
        return self.memberLevel ?? self.mentorLevel ?? 0
    }
    
    public func getHometown() -> String {
        return self.hometown
    }
    
    public func getAge() -> Int {
        return self.age
    }
    
    public func getContactInfo() -> ContactInformation {
        return self.contactInformation
    }
    
    public func getTeam() -> TeamType {
        return self.team
    }
    
    public func getMotivationLevel() -> Int? {
        return self.motivationLevel
    }
    
    public func increaseMotivation(amountOf amount : Int) {
        if let currentMotivation = self.motivationLevel {
            self.motivationLevel = currentMotivation + amount
            print("\(self.fullName)'s motivation is increased by \(amount) new value is \(self.motivationLevel!)")
        } else {
            self.motivationLevel = 1
            print("\(self.fullName) had no motivation now it's \(self.motivationLevel!)")
        }
    }
}

class ContactInformation {
    private var phoneNumber : String
    private var email : String
    
    init(phoneNumber: String, email: String) {
        self.phoneNumber = phoneNumber
        self.email = email
    }
    public func getPhoneNumber() -> String {
        return self.phoneNumber
    }
    
    public func getEmail() -> String {
        return self.email
    }
}

let member1 = NeonAcademyMember(fullName: "Eken Özlü", title: "A1 Seviye iOS Geliştirici", horoscope: "Oğlak", memberLevel: 1, hometown: "Adana", age: 22, contactInformation: ContactInformation(phoneNumber: "05376278065", email: "ekenozlu8@gmail.com"), team: .iOS, motivationLevel: 5)
let member2 = NeonAcademyMember(fullName: "Mehmet Kaan", title: "A1 Seviye iOS Geliştirici", horoscope: "Başak", memberLevel: 1, hometown: "Trabzon", age: 27, contactInformation: ContactInformation(phoneNumber: "05312345678", email: "mehmetKaan@gmail.com"), team: .iOS)
let member3 = NeonAcademyMember(fullName: "Ayşe Yılmaz", title: "A2 Seviye Android Geliştirici", horoscope: "Oğlak", memberLevel: 2, hometown: "Adana", age: 22, contactInformation: ContactInformation(phoneNumber: "05456789012", email: "ayseYilmaz@gmail.com"), team: .Android, motivationLevel: 1)
let member4 = NeonAcademyMember(fullName: "Ali Demir", title: "A3 Seviye UI/UX Tasarımcısı", horoscope: "İkizler", memberLevel: 3, hometown: "İstanbul", age: 30, contactInformation: ContactInformation(phoneNumber: "05567890123", email: "aliDemir@gmail.com"), team: .UI_UX, motivationLevel: 3)
let member5 = NeonAcademyMember(fullName: "Zeynep Şahin", title: "A1 Seviye Android Uzmanı", horoscope: "Koç", memberLevel: 1, hometown: "İzmir", age: 25, contactInformation: ContactInformation(phoneNumber: "05345678901", email: "zeynepSahin@gmail.com"), team: .Android)

var memberArray : [NeonAcademyMember] = [member1,member2,member3,member4,member5]

//Create a function that prints out a message based on the member's motivation level. For example, if the motivation level is nil, the function should print out "This member has no motivation level set" and if the motivation level is greater than 5, the function should print out "This member is highly motivated". ( You should use guard let for this task)
print("---Print different messages based on motivation---")
func printMessageForMotivations(){
    for member in memberArray {
        guard let memberMotivation = member.getMotivationLevel() else {
            print("This member has no motivation level set")
            continue
        }
        if member.getMotivationLevel()! >= 5 {
            print("This member is highly motivated")
        }
    }
}
printMessageForMotivations()

//Create a function that takes a member's motivation level as an input and returns a string indicating whether the member is highly motivated, moderately motivated, or not motivated at all.
func printMotivationStatus(fromMotivationLevel level : Int?){
    guard let level = level else {
        print("This member is not motivated at all")
        return
    }
    if level <= 3 {
        print("This member is moderately motivated")
    } else {
        print("This member is highly motivated")
    }
}

print("---Print motivation status---")
for member in memberArray {
    printMotivationStatus(fromMotivationLevel: member.getMotivationLevel())
}

//Create a function that takes a member and returns the member's motivation level if it is not nil, otherwise it returns 0.  ( You should use nil coalescing for this task)
print("---Print motivation level with coalescing---")
func getMotivationLevel(ofMember member : NeonAcademyMember) -> Int{
    return member.getMotivationLevel() ?? 0
}
for member in memberArray {
    print(getMotivationLevel(ofMember: member))
}

//Create a function that takes a member and a target motivation level as inputs, and returns true if the member's current motivation level is greater than or equal to the target level, or false otherwise. ( You should use iv let for this task)
func checkForMotivation(ofMember member : NeonAcademyMember, withTarget target : Int) -> Bool{
    if let motivation = member.getMotivationLevel() {
        return motivation >= target
    }
    return false
}
print("---Print motivation target of members---")
for member in memberArray {
    print(checkForMotivation(ofMember: member, withTarget: 3))
}


