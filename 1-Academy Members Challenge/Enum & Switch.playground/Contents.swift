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
    
    init(fullName: String, title: String, horoscope: String, memberLevel: Int? = nil, mentorLevel: Int? = nil, hometown: String, age: Int, contactInformation: ContactInformation, team: TeamType) {
        self.fullName = fullName
        self.title = title
        self.horoscope = horoscope
        self.memberLevel = memberLevel
        self.mentorLevel = mentorLevel
        self.hometown = hometown
        self.age = age
        self.contactInformation = contactInformation
        self.team = team
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

let member1 = NeonAcademyMember(fullName: "Eken Özlü", title: "A1 Seviye iOS Geliştirici", horoscope: "Oğlak", memberLevel: 1, hometown: "Adana", age: 22, contactInformation: ContactInformation(phoneNumber: "05376278065", email: "ekenozlu8@gmail.com"),team: .iOS)
let member2 = NeonAcademyMember(fullName: "Mehmet Kaan", title: "A1 Seviye iOS Geliştirici", horoscope: "Başak", memberLevel: 1, hometown: "Trabzon", age: 27, contactInformation: ContactInformation(phoneNumber: "05312345678", email: "mehmetKaan@gmail.com"),team: .iOS)
let member3 = NeonAcademyMember(fullName: "Ayşe Yılmaz", title: "A2 Seviye Android Geliştirici", horoscope: "Oğlak", memberLevel: 2, hometown: "Adana", age: 22, contactInformation: ContactInformation(phoneNumber: "05456789012", email: "ayseYilmaz@gmail.com"),team: .Android)
let member4 = NeonAcademyMember(fullName: "Ali Demir", title: "A3 Seviye UI/UX Tasarımcısı", horoscope: "İkizler", memberLevel: 3, hometown: "İstanbul", age: 30, contactInformation: ContactInformation(phoneNumber: "05567890123", email: "aliDemir@gmail.com"),team: .UI_UX)
let member5 = NeonAcademyMember(fullName: "Zeynep Şahin", title: "A1 Seviye Android Uzmanı", horoscope: "Koç", memberLevel: 1, hometown: "İzmir", age: 25, contactInformation: ContactInformation(phoneNumber: "05345678901", email: "zeynepSahin@gmail.com"),team: .Android)

var memberArray : [NeonAcademyMember] = [member1,member2,member3,member4,member5]

print("---Initial Array---")
for member in memberArray {
    print(member.getFullName())
}

//Create a new array that contains only the members of the iOS Development Team and print out their full names.
var iosDevelopersArray = memberArray.filter { member in
    member.getTeam() == .iOS
}
print("---iOS Developers Array---")
for member in iosDevelopersArray {
    print(member.getFullName())
}

//Create a dictionary that contains the number of members in each team, and print out the number of members in the UI/UX Design Team.
var teamDict : [TeamType : [NeonAcademyMember]] = [:]
for member in memberArray {
    if var teamList = teamDict[member.getTeam()] {
        teamList.append(member)
        teamDict[member.getTeam()] = teamList
    } else {
        teamDict[member.getTeam()] = [member]
    }
}
print("---Count of UI/UX Design Team---")
print(teamDict[.UI_UX]?.count ?? 0)

//Create a function that takes a team as an input and prints out the full names of all members in that team.
func printMemberNames(fromTeam team : TeamType) {
    for member in memberArray {
        if member.getTeam() == team {
            print(member.getFullName())
        }
    }
}
print("---Printing Team Members with Function---")
printMemberNames(fromTeam: .Android)

//"Create a switch statement that performs different actions based on the team of a member. For example, if a member is in the iOS Development Team, the function could print out "This member is a skilled iOS developer", and if the member is in the UI/UX Design Team, the function could print out "This member is a talented designer".
print("---Printing Sentences with Switch Statement---")
for member in memberArray {
    switch member.getTeam() {
    case .iOS:
        print("This member is a skilled iOS developer")
    case .Android:
        print("There is no sentence for this member")
    case .UI_UX:
        print("This member is a talented designer")
    }
}

//Create a function that takes an age as an input and prints out the full names of all members that are older than that age and belong to a specific team (iOS Development Team for example)
func printFullnames(olderThan age : Int, fromTeam team : TeamType) {
    for member in memberArray {
        if member.getAge() >= age && member.getTeam() == team {
            print(member.getFullName())
        }
    }
}

print("---Printing Team Members from Function with age and team constraint---")
printFullnames(olderThan: 21, fromTeam: .Android)


//Create a switch statement that gives a promotion to a member based on their team. For example, if a member is in the iOS Development Team, the function could promote them to "Senior iOS Developer" and if the member is in the UI/UX Design Team, the function could promote them to "Lead Designer".
print("---Printing Team Members with Promotion---")
for member in memberArray {
    switch member.getTeam() {
    case .iOS:
        member.setTitle("Senior iOS Developer")
    case .Android:
        member.setTitle("Senior Android Developer")
    case .UI_UX:
        member.setTitle("Lead Designer")
    }
    print("\(member.getFullName()) -- \(member.getTitle())")
}

//Create a function that takes a team as an input and calculates the average age of the members in that team.
func printAverageAge(ofTeam team : TeamType) {
    var totalAge = 0
    var memberCount = 0
    for member in memberArray {
        if member.getTeam() == team {
            totalAge += member.getAge()
            memberCount += 1
        }
    }
    print(Double(totalAge)/Double(memberCount))
}

print("---Printing Team Average Age from Function with team constraint---")
printAverageAge(ofTeam: .Android)

//Create a switch statement that prints out a different message for each team, such as "The iOS Development Team is the backbone of our academy" for the iOS Development Team and "The UI/UX Design Team is the face of our academy" for the UI/UX Design Team.
print("---Printing different messages for members according to their team---")
for member in memberArray {
    switch member.getTeam() {
    case .iOS:
        print("The iOS Development Team is the backbone of our academy")
    case .Android:
        print("The Android Development Team is the backbone of our academy")
    case .UI_UX:
        print("The UI/UX Design Team is the face of our academy")
    }
}

//Create a function that takes a team as an input and returns an array of the contact information of all members in that team.
print("---Printing contact info according to the team---")
func printContactInfo(fromTeam team : TeamType) {
    for member in memberArray {
        if member.getTeam() == team {
            print("\(member.getContactInfo().getPhoneNumber()) -- \(member.getContactInfo().getEmail())")
        }
    }
}
printContactInfo(fromTeam: .UI_UX)

//Create a switch statement that performs different actions based on the team of a member and their age. For example, if a member is in the iOS Development Team and is over 23 years old, the function could print out "XXX member is a seasoned iOS developer", and if the member is in the UI/UX Design Team and is under 24, the function could print out "XXX member is a rising star in the design world".
print("---Printing different inspirational sentence for each team member---")
for member in memberArray {
    var roleName = ""
    switch member.getTeam() {
    case .iOS:
        roleName = "iOS Developer"
    case .Android:
        roleName = "Android Developer"
    case .UI_UX:
        roleName = "UI/UX Designer"
    }
    if member.getAge() >= 24 {
        print("\(member.getFullName()) is a seasoned \(roleName)")
    } else {
        print("\(member.getFullName()) is a rising talent in \(roleName)")
    }
}
