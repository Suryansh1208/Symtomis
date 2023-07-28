# devpirates

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


// code explanation

starting off with the main.dart file. The main function is is async and firebase is intialized which we use as our database.

Before jumping into the code let us understand the database structure

    The database is fully made with Firebase's firestore.
    There are two collections in the database "disease" and an "symptom"

    The disease collection consist of document id's consisting of name of the disease, cause of the disease, medicines and prevention for the disease.

    The symptom collection consist of document id's consisting of some major symptoms of the disease as the name key and disease key as the list of diseases due to which the symptoms are caused.


Now talking about the app,
            the app is basically divided into 3 major parts 
                    
                The first page is just an info about the app and what all features can we get in the app.


                The second page is all about exploring our first feature which is the disease descriptioner. The user enters the disease and selects what he wants to know about it such as [medicine,prevention or symptoms].
                This part of the app uses our disease collection which is stored in our firebase as preveously discussed.


                The third stage is all about predicting the disease using the symptoms provided by the user. Currently we are just fetching it from our database from the symptom collection but in future we will try to appy NLP and other ML algorithms to make it more accurate and user friendly.

