# cinesearch

A Flutter app featuring a custom search bar with a debounce mechanism for optimized search input handling.

## Getting Started

Prerequisites
Make sure you have the following installed:

Flutter (version 3.22.2)
Dart SDK (comes with Flutter)
Code editor (e.g., VS Code or Android Studio)

1. Clone the Repository

Clone the project repository to your local machine using the command below:

git clone https://github.com/VishnuPuklath/CineSearch.git

cd CineSearch

2. Install Dependencies
   Run the following command to install all necessary dependencies:
   flutter pub get

3. Run the App
   Connect a physical device or emulator, and run the following command:
   flutter run

   Features
   Custom Search Bar: A stylish search bar with a rounded design.
   Debounce Mechanism: Avoids unnecessary calls by delaying the onChanged callback until the user stops typing for 500 milliseconds.
   Dynamic Hint: Displays a user-friendly hint (Enter movie name...).

   Dependencies
   This app relies on the following packages:

   flutter_bloc: For state management.
   http: For handling API requests.
   fpdart: For functional programming utilities.
   get_it:Dependency injection
   Ensure these dependencies are installed with flutter pub get.
