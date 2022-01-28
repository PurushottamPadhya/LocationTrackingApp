# LocationTrackingApp

This application is developed by Purushottam Padhya 
All the copy rights on behlf of @Padhya

The app simply track the user location and notified user if the user moved 10 meter away from there previous location. 

The App is developed on SWIFT language with target iOS Version is 15. 
Swift language uses : Swift 5
Build for iPhone and iPad

The design layout were created on the storyboard format with multiple storyboard with navigation controller. 

The flow of the application itself is showing first screen and click on the start tracking button directed to tracking screen with map is showing. 
The LocationManager Library class is created using CLLocationManagerDelegate service provided by apple. get device location on every time and stored the previous location and compare on each updates and if distance is greater than 10 update the previous location and show alert that you have moved more than 10 meter distance from your previous distance. 

This is all about the applicationa and to run the application extract .zip file and open using xcode updated(13).
Then run the code by selecting one of simulator and changed address from simulator and verify it working.

Since after developed application I have tried with Unit testing and I found that code is too coupled for testing and for the solutions we need to use protocol oriented framework so that we can make mock class to do a testing without coupling by abstracting a layer.



