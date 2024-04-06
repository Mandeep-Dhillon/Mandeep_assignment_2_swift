/*

Write a simple program that will generate/print a customer email list
formated as: Name: Jane Doe Email: jdoe@gmail.com
create a Location struct with x and y coordinates (as we did with the pizza example)
use the same storeRange from the pizza example as well, 2.5 (change if you like of course)
create 2 store locations (Location, as we did with the pizza example)
create a Customer struct that includes the following properties:
name (String, full name )
email (String, don't worry about validation for now)
phone number (String, don't worry about validation for now)
acceptedNewsletter (Bool)
location (Location, x and y coordinates, just like the pizza example)
create an array of customers (Customer, at least 10)
write a function that takes in a single store location and the collection of customers and prints the email addresses of customers that are within the storeRange (you can use the distance formula from the pizza example)
 */


// Defining a Location as struct
struct Location {
    let x: Int
    let y: Int
}

// Defining a Customer as struct
struct CustomerArea {
    let center: Location
    var radius: Double
    
    // Defining a function to calculate distance between two locations
    func contains(_ location: Location) -> Bool {
        let distanceX = Double(center.x - location.x)
        let distanceY = Double(center.y - location.y)
        let distance = (distanceX * distanceX + distanceY * distanceY).squareRoot()
        return distance < radius
    }
}

struct Customer {
    var name: String
    var email: String
    var phoneNumber: String
    var location: Location
    var acceptedNewsletter: Bool {
        return false
    }
}

var customers: [Customer] = []

// Creating the store locations
let storeLocation = Location(x: 3, y: 3)
let storeArea = CustomerArea(center: storeLocation, radius: 2.5)

// Creating an array of customers
var cust = Customer(name: "Bob Smith", email: "bob@hotmail.com", phoneNumber: "1243567890", location: Location(x: 1, y: 1))
customers.append(cust)

cust = Customer(name: "Neil Stephenson", email: "neil@yahoo.com", phoneNumber: "2435678901", location: Location(x: 2, y: 2))
customers.append(cust)

cust = Customer(name: "John Disusa", email: "john@gmail.com", phoneNumber: "4356789012", location: Location(x: 2, y: 2))
customers.append(cust)

cust = Customer(name: "Micheal Smith", email: "mick@hotmail.com", phoneNumber: "3567890432", location: Location(x: 1, y: 1))
customers.append(cust)

cust = Customer(name: "Andy Hutton", email: "andy@ymail.com", phoneNumber: "5678901234", location: Location(x: 1, y: 1))
customers.append(cust)

cust = Customer(name: "Cathy Kahlohn", email: "cathy@hotmail.com", phoneNumber: "6789086768", location: Location(x: 2, y: 2))
customers.append(cust)

cust = Customer(name: "Lucy Hutton", email: "lucy@gmail.com", phoneNumber: "6475808907", location: Location(x: 1, y: 1))
customers.append(cust)

cust = Customer(name: "Richael karlo", email: "richeal@hotmail.com", phoneNumber: "6789012341", location: Location(x: 2, y: 2))
customers.append(cust)

cust = Customer(name: "Andrew Hutton", email: "andrew@yahoo.com", phoneNumber: "9058395608", location: Location(x: 2, y: 2))
customers.append(cust)

cust = Customer(name: "Tony Smith", email: "tony@hotmail.com", phoneNumber: "4167896789", location: Location(x: 1, y: 1))
customers.append(cust)

cust = Customer(name: "Timmohty Noshwki", email: "tim@hotmail.com", phoneNumber: "5194876990", location: Location(x: 2, y: 2))
customers.append(cust)

// Function to search customers by email and within store range
func searchCustomerByEmailWithinRange(searchEmail: String, storeArea: CustomerArea, customers: [Customer]) -> [String] {
    var results: [String] = []
    for cust in customers {
        if cust.email == searchEmail && storeArea.contains(cust.location) {
            results.append("Name: \(cust.name), email: \(cust.email), phone: \(cust.phoneNumber)")
        }
    }
    if results.isEmpty {
        results.append("No customer found with the email \(searchEmail) within the store range.")
    }
    return results
}

// using this as an example:
let searchEmail = "mick@hotmail.com"
let searchResults = searchCustomerByEmailWithinRange(searchEmail: searchEmail, storeArea: storeArea, customers: customers)
for result in searchResults {
    print(result)
}

