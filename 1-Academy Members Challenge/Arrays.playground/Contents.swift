import UIKit

class NeonAcademyMember {
    private var fullName : String
    private var title : String
    private var horoscope : String
    private var memberLevel : Int?
    private var mentorLevel : Int?
    private var hometown : String
    private var age : Int
    private var contactInformation : ContactInformation
    
    init(fullName: String, title: String, horoscope: String, memberLevel: Int? = nil, mentorLevel: Int? = nil, hometown: String, age: Int, contactInformation: ContactInformation) {
        self.fullName = fullName
        self.title = title
        self.horoscope = horoscope
        self.memberLevel = memberLevel
        self.mentorLevel = mentorLevel
        self.hometown = hometown
        self.age = age
        self.contactInformation = contactInformation
    }
    
    
    public func getFullName() -> String {
        return self.fullName
    }
    
    public func getTitle() -> String {
        return self.title
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

let member1 = NeonAcademyMember(fullName: "Eken Özlü", title: "A1 Seviye iOS Geliştirici", horoscope: "Oğlak", memberLevel: 1, hometown: "Adana", age: 22, contactInformation: ContactInformation(phoneNumber: "05376278065", email: "ekenozlu8@gmail.com"))
let member2 = NeonAcademyMember(fullName: "Mehmet Kaan", title: "A1 Seviye iOS Geliştirici", horoscope: "Başak", memberLevel: 1, hometown: "Trabzon", age: 27, contactInformation: ContactInformation(phoneNumber: "05312345678", email: "mehmetKaan@gmail.com"))
let member3 = NeonAcademyMember(fullName: "Ayşe Yılmaz", title: "A1 Seviye Web Geliştirici", horoscope: "Oğlak", memberLevel: 2, hometown: "Adana", age: 22, contactInformation: ContactInformation(phoneNumber: "05456789012", email: "ayseYilmaz@gmail.com"))
let member4 = NeonAcademyMember(fullName: "Ali Demir", title: "Java Yazılım Mühendisi", horoscope: "İkizler", memberLevel: 3, hometown: "İstanbul", age: 30, contactInformation: ContactInformation(phoneNumber: "05567890123", email: "aliDemir@gmail.com"))
let member5 = NeonAcademyMember(fullName: "Zeynep Şahin", title: "A1 Seviye Veritabanı Uzmanı", horoscope: "Koç", memberLevel: 1, hometown: "İzmir", age: 25, contactInformation: ContactInformation(phoneNumber: "05345678901", email: "zeynepSahin@gmail.com"))

var memberArray : [NeonAcademyMember] = [member1,member2,member3,member4,member5]

print("---Initial Array---")
for member in memberArray {
    print(member.getFullName())
}

//Delete 3rd member
var thirdMemberDeleted = memberArray
thirdMemberDeleted.remove(at: 2)
print("---After deleting 3rd member---")
for member in thirdMemberDeleted {
    print(member.getFullName())
}
        

//Rank the members according to their age from largest to smallest.
var ageDescendingArray = memberArray.sorted { m1, m2 in m1.getAge() > m2.getAge() }
print("---After sorting age largest to smallest---")
for member in ageDescendingArray {
    print("\(member.getFullName()) -- \(member.getAge())")
}

//Sort the members according to their names (Z-A).
var nameDescendingArray = memberArray.sorted { m1, m2 in m1.getFullName() > m2.getFullName() }
print("---After sorting Z to A---")
for member in nameDescendingArray {
    print(member.getFullName())
}

//Filter the members of the Academy who are older than 24 and transfer them to a new array. Print the names of the members in this array
var olderThan24Array = memberArray.filter { member in member.getAge() >= 24 }
print("---After filtering members older than 24---")
for member in olderThan24Array {
    print("\(member.getFullName()) -- \(member.getAge())")
}

//Print the total number of iOS Developers.
var iosDevelopersArray = memberArray.filter { member in
    member.getTitle().lowercased().contains("ios".lowercased())
}
print("---Total Number of iOS Developers---")
print(iosDevelopersArray.count)

//Find which index you come across in the array and print it.
print("---Index of me (Eken Özlü)---")
for index in 0...memberArray.count-1 {
    if memberArray[index].getFullName() == "Eken Özlü" {
        print(index)
    }
}

//Add a new member to the array, who is a mentor of the academy and has a special property "mentorLevel" indicating their level of experience.
let mentor1 = NeonAcademyMember(fullName: "Ayhan Yavuz", title: "Senior iOS Developer", horoscope: "Yengeç", mentorLevel: 5, homeTown: "Isparta", age: 33, contactInformation: ContactInformation(phoneNumber: "05123456789", email: "mentor@gmail.com"))
memberArray.append(mentor1)
//Print out the full names of all members after adding the new member.
print("---After adding a mentor---")
for member in memberArray {
    print(member.getFullName())
}

//Remove all members who have a specific memberLevel, for example, "1", and print out the remaining members' full names.
var removedMemberLevelArray = memberArray.filter { member in
    member.getMemberOrMentorLevel() == 1
}
print("---After removing members with level 1---")
for member in removedMemberLevelArray {
    print("\(member.getFullName()) -- \(member.getMemberOrMentorLevel())")
}

//Find the member with the highest age and print out their full name and age.
var memberWithHighestAge = memberArray.sorted { m1, m2 in m1.getAge() > m2.getAge() }.first!
print("---Oldest Member---")
print("\(memberWithHighestAge.getFullName()) -- \(memberWithHighestAge.getAge())")

//Find the member with the longest name and print out their full name and the length of their name.
var longestNameMember = memberArray.sorted { m1, m2 in
    m1.getFullName().count > m2.getFullName().count
}.first!
print("---Member with Longest Name---")
print("\(memberWithHighestAge.getFullName()) -- \(memberWithHighestAge.getFullName().count)")

//Find all members who have the same horoscope sign and group them together in a new array. Print out the full names of members in this new array.
var horoscopeGroups : [String : [NeonAcademyMember]] = [:]
for member in memberArray {
    if var horoscopeList = horoscopeGroups[member.getHoroscope()] {
        horoscopeList.append(member)
        horoscopeGroups[member.getHoroscope()] = horoscopeList
    } else {
        horoscopeGroups[member.getHoroscope()] = [member]
    }
}

print("---Member grouped according to the horoscopes---")
for (horoscope,memberList) in horoscopeGroups {
    print("-\(horoscope)")
    for member in memberList {
        print("    -\(member.getFullName())")
    }
}

//Find the most common hometown among the members and print out the name of the town.
var hometownCount : [String:Int] = [:]

for member in memberArray {
    if let count = hometownCount[member.getHometown()] {
        hometownCount[member.getHometown()] = count + 1
    } else {
        hometownCount[member.getHometown()] = 1
    }
}

var mostCommonHometown = ""
var highestCount = 0

for (hometown,count) in hometownCount {
    if count > highestCount {
        mostCommonHometown = hometown
        highestCount = count
    }
}
print("The most common hometown is: \(mostCommonHometown) (appeared \(highestCount) times)")

//Find the average age of all members and print out the result.
var totalAge = 0
for member in memberArray {
    totalAge += member.getAge()
}
var averageAge = Double(totalAge) / Double(memberArray.count)
print("Average age of the team is \(averageAge)")

//Create a new array that contains only the contact information of the members, and print out the email addresses of all members in this new array.
var contactInfoArray : [ContactInformation] = []
for member in memberArray {
    contactInfoArray.append(member.getContactInfo())
}
print("---Emails of the team from Contact Information Array---")
for contact in contactInfoArray {
    print(contact.getEmail())
}

//Sort the members according to their memberLevel (highest to lowest) and print out their full names.
var levelSortedArray = memberArray.sorted { m1, m2 in m1.getMemberOrMentorLevel() > m2.getMemberOrMentorLevel() }
print("---Levels sorted High to Low---")
for member in levelSortedArray {
    print("\(member.getFullName()) -- \(member.getMemberOrMentorLevel())")
}

//Find all members who have the same title and create a new array of their contact information, then print out the phone numbers of all members in this new array.
var titleGroups : [String : [NeonAcademyMember]] = [:]
for member in memberArray {
    if var titleList = titleGroups[member.getTitle()] {
        titleList.append(member)
        titleGroups[member.getTitle()] = titleList
    } else {
        titleGroups[member.getTitle()] = [member]
    }
}

print("---Phone Numbers of Members grouped according to the titles---")
for (title,memberList) in titleGroups {
    print("-\(title)")
    for member in memberList {
        print("    -\(member.getContactInfo().getPhoneNumber())")
    }
}
