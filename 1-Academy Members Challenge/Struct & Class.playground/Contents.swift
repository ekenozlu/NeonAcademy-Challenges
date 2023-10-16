import UIKit

class NeonAcademyMember {
    private var fullName : String
    private var title : String
    private var horoscope : String
    private var memberLevel : String
    private var homeTown : String
    private var age : Int
    private var contactInformation : ContactInformation
    
    init(fullName: String, title: String, horoscope: String, memberLevel: String, homeTown: String, age: Int, contactInformation: ContactInformation) {
        self.fullName = fullName
        self.title = title
        self.horoscope = horoscope
        self.memberLevel = memberLevel
        self.homeTown = homeTown
        self.age = age
        self.contactInformation = contactInformation
    }
    
    public func printName() {
        print(self.fullName)
    }
}

class ContactInformation {
    private var phoneNumber : String
    private var email : String
    
    init(phoneNumber: String, email: String) {
        self.phoneNumber = phoneNumber
        self.email = email
    }
}

let member1 = NeonAcademyMember(fullName: "Eken Özlü", title: "A1 Level iOS Geliştirici", horoscope: "Capricorn", memberLevel: "1", homeTown: "Adana", age: 22, contactInformation: ContactInformation(phoneNumber: "05376278065", email: "ekenozlu8@gmail.com"))
let member2 = NeonAcademyMember(fullName: "Mehmet Kaan", title: "A1 Level iOS Geliştirici", horoscope: "Virgo", memberLevel: "1", homeTown: "Trabzon", age: 27, contactInformation: ContactInformation(phoneNumber: "05312345678", email: "mehmetKaan@gmail.com"))
let member3 = NeonAcademyMember(fullName: "Ayşe Yılmaz", title: "Başlangıç Seviyesi Web Geliştirici", horoscope: "Oğlak", memberLevel: "2", homeTown: "Ankara", age: 22, contactInformation: ContactInformation(phoneNumber: "05456789012", email: "ayseYilmaz@gmail.com"))
let member4 = NeonAcademyMember(fullName: "Ali Demir", title: "Java Yazılım Mühendisi", horoscope: "İkizler", memberLevel: "3", homeTown: "İstanbul", age: 30, contactInformation: ContactInformation(phoneNumber: "05567890123", email: "aliDemir@gmail.com"))
let member5 = NeonAcademyMember(fullName: "Zeynep Şahin", title: "A1 Seviyesi Veritabanı Uzmanı", horoscope: "Koç", memberLevel: "1", homeTown: "İzmir", age: 25, contactInformation: ContactInformation(phoneNumber: "05345678901", email: "zeynepSahin@gmail.com"))
let member6 = NeonAcademyMember(fullName: "Emre Yıldız", title: "Python Programcısı", horoscope: "Boğa", memberLevel: "2", homeTown: "Bursa", age: 28, contactInformation: ContactInformation(phoneNumber: "05434567890", email: "emreYildiz@gmail.com"))
let member7 = NeonAcademyMember(fullName: "Deniz Kaya", title: "C# Geliştirici", horoscope: "Balık", memberLevel: "3", homeTown: "Antalya", age: 31, contactInformation: ContactInformation(phoneNumber: "05523456789", email: "denizKaya@gmail.com"))
let member8 = NeonAcademyMember(fullName: "Selin Akgün", title: "Mobil Uygulama Tasarımcısı", horoscope: "Terazi", memberLevel: "2", homeTown: "Adana", age: 27, contactInformation: ContactInformation(phoneNumber: "05323456789", email: "selinAkgun@gmail.com"))
let member9 = NeonAcademyMember(fullName: "Onur Tekin", title: "A2 Seviyesi Yapay Zeka Geliştirici", horoscope: "Aslan", memberLevel: "2", homeTown: "Trabzon", age: 29, contactInformation: ContactInformation(phoneNumber: "05412345678", email: "onurTekin@gmail.com"))
let member10 = NeonAcademyMember(fullName: "Esra Çelik", title: "UI/UX Tasarımcı", horoscope: "Yengeç", memberLevel: "3", homeTown: "Konya", age: 26, contactInformation: ContactInformation(phoneNumber: "05512345678", email: "esraCelik@gmail.com"))
let member11 = NeonAcademyMember(fullName: "Ahmet Can", title: "A1 Seviyesi İş Analisti", horoscope: "Başak", memberLevel: "1", homeTown: "Eskişehir", age: 24, contactInformation: ContactInformation(phoneNumber: "05356789012", email: "ahmetCan@gmail.com"))
let member12 = NeonAcademyMember(fullName: "Merve Arslan", title: "Front-End Geliştirici", horoscope: "Kova", memberLevel: "2", homeTown: "Gaziantep", age: 28, contactInformation: ContactInformation(phoneNumber: "05423456789", email: "merveArslan@gmail.com"))
let member13 = NeonAcademyMember(fullName: "Burak Yılmaz", title: "Veri Bilimci", horoscope: "Koç", memberLevel: "3", homeTown: "Adana", age: 32, contactInformation: ContactInformation(phoneNumber: "05534567890", email: "burakYilmaz@gmail.com"))
let member14 = NeonAcademyMember(fullName: "Ebru Aydın", title: "A1 Seviyesi Yazılım Testçisi", horoscope: "Boğa", memberLevel: "1", homeTown: "Kocaeli", age: 23, contactInformation: ContactInformation(phoneNumber: "05345678901", email: "ebruAydin@gmail.com"))
let member15 = NeonAcademyMember(fullName: "Canan Özdemir", title: "Araştırma Analisti", horoscope: "Terazi", memberLevel: "2", homeTown: "Trabzon", age: 27, contactInformation: ContactInformation(phoneNumber: "05423456789", email: "cananOzdemir@gmail.com"))


var memberArray : [NeonAcademyMember] = [member1,member2,member3,member4,member5,
                                         member6,member7,member8,member9,member10,
                                         member11,member12,member13,member14,member15]

for member in memberArray {
    member.printName()
}
