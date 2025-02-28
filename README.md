Sri Lankan NIC Decoder
The Sri Lankan NIC Details Decoder is a super helpful Flutter application that decodes and extracts essential details from Sri Lankan National Identity Card (NIC) numbers. By simply entering an NIC number, you can instantly see key details like the date of birth, weekday of birth, age, gender, and even voting eligibility! 🎉

Features ✨
NIC Format Extraction 
🔍: Supports both the old and new NIC formats—whether it's a classic NIC or a modern one, this app handles both!
Detailed Information 
📊: The app will decode and display:
Date of Birth 
🎂: The exact birth date of the person.
Weekday of Birth 
📅: Find out which weekday they were born on (you might be surprised!).
Age 
🎉: Calculates the person’s current age based on their NIC.
Gender 
🚻: Decodes whether the person is male or female.
Serial Number 
🔢: Shows the unique serial number associated with the NIC.
Voting Eligibility 
🗳️: Tells you if the person is eligible to vote based on their age.
User-Friendly Interface 
🌟: Designed with Material 3 for a clean, easy-to-navigate, and visually pleasing experience.
Efficient Data Handling 
⚡: The app quickly processes the NIC and provides error-free results. If the input isn’t valid, you’ll get a helpful error message! 💡
Smooth Navigation 
🔄: Uses GetX for seamless state management and navigation, ensuring a smooth user experience.
Tech Stack 
🛠️
Flutter 
💻: The UI framework that powers the app with high performance and compatibility across different devices.
Dart 
🦸‍♂️: The programming language behind the app, known for its speed and efficiency.
GetX 
🚀: A lightweight solution for state management and navigation, making the app fast and easy to use.
Material 3 
🎨: The modern design system that ensures the app looks fantastic and consistent across all screens.
User Experience 
🎉
The app has two main screens:

Input Screen 
🎯: This is where the magic happens! You enter the NIC number in a simple text field. Once you hit "Decode," the app takes care of the rest. If there’s a mistake in the NIC format, the app will guide you with a friendly error message.

Result Screen 
🏆: Here, all the decoded details are displayed clearly, with fun and easy-to-read cards. You’ll see:

Date of birth 
🎂
Weekday of birth 
📅
Age 🎉
Gender 🚻
Voting eligibility 🗳️
It’s all presented neatly with beautiful icons, making it easy and fun to read!

APK Release 📦
After you finish building your app, you can create a release APK 📲 that can be installed directly on users' phones. It’s a super easy way to share the app with others!

Folder Structure 🗂️
The folder structure is designed to be clean and organized:

Bindings 🛠️: Responsible for connecting controllers to the rest of the app via GetX.
Controllers 🤖: Where the logic happens! Handles user input, validation, and decoding of the NIC number.
Screens 📱: The actual screens that show the input form and display the results.
Widgets 🔧: Reusable components like the NIC input field and the result cards.
Utils ⚙️: Helper functions, including the core logic for decoding the NIC number.
