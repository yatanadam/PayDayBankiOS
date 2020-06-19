# PayDayBank

Architectural Flow

ViewController -> Presenter -> ViewController view Protocol

Technical questions

* How long did you spend on the coding test? What would you add to your solution if you had more time? If you didn't spend much time on the coding test then use this as an opportunity to explain what you would add.

1 of 8 we spend test on our time. Our time is limited so we couldnt spend much time. If we have time we use both unit and UI test. Our test code included in repo.

* What was the most useful feature that was added to the latest version of your chosen language? Please include a snippet of code that shows how you've used it.

We use keypath as functions now. Example code below;

struct Animal {
    let name: String
    let age: Int
    let type: String?
}

let twetee = Animal(name: "Twetee", age: 18, type: "Bir")
let sunny = Animal(name: "Sunny", age: 19, type: "Cat")
let blue = Animal(name: "Blue", age: 17, type: "Bird")
let animals = [twetee, sunny, blue]

let types = animals.map(\.type)
print(types)


* How would you track down a performance issue in production? Have you ever had to do this?

Use instruments and device metrics. Yes

* How would you debug issues related to API usage? Can you give us an example?

First check for api call result. Check types and conventions. For example in PayDayBank api we need to change First Name to first_name for db convention.

* How would you improve the Node server’s API that you just used?

Add security checking.
