//
//  News.swift
//  Page Control
//
//  Created by Eken Özlü on 4.10.2023.
//

import UIKit

struct News {
    let image : UIImage!
    let title : String!
    let text : String!
    
    init(image: UIImage!, title: String!, text: String!) {
        self.image = image
        self.title = title
        self.text = text
    }
}

let news1 = News(image: UIImage(named: "image1"),
                 title: "Kingdom of Veridia Celebrates Centennial with Grand Festivities",
                 text: "In a jubilant display of unity and history, the Kingdom of Veridia celebrated its centennial anniversary with a week-long extravaganza. Festivities included parades, historical reenactments, and a breathtaking fireworks display that lit up the night sky. The kingdom's citizens, dressed in period costumes, came together to honor a century of progress, peace, and prosperity.")
let news2 = News(image: UIImage(named: "image2"),
                 title: "Mysterious Enchanted Forest Discovered in the Heart of Valewood",
                 text: "Adventurers and scholars alike are abuzz with excitement as a previously unknown enchanted forest was discovered deep within the kingdom's lush Valewood region. Local legends hinted at the forest's existence, but it had remained hidden for centuries. Experts are now studying the unique flora and fauna, and rumors of magical creatures living within have sparked curiosity and wonder among the populace.")
let news3 = News(image: UIImage(named: "image3"),
                 title: "Kingdom of Veridia Unveils Ambitious Renewable Energy Initiative",
                 text: "In a groundbreaking move toward sustainability, the Kingdom of Veridia has announced an ambitious renewable energy initiative. The kingdom plans to harness the power of wind, solar, and hydroelectric energy to reduce its carbon footprint and combat climate change. The initiative aims to make Veridia a model for eco-conscious governance and promote a brighter, greener future.")
let news4 = News(image: UIImage(named: "image4"),
                 title: "Royal Heir to the Throne Announces Engagement to Foreign Diplomat",
                 text: "In a surprising turn of events, Princess Isabella, the beloved royal heir to the Kingdom of Veridia, has announced her engagement to a foreign diplomat from the neighboring realm of Elaria. The union is expected to strengthen diplomatic ties between the two kingdoms and is met with widespread support. The royal couple's upcoming wedding promises to be a grand affair, bringing two kingdoms together in joyous celebration.")

let newsArray : [News] = [news1,news2,news3,news4]
