![loginLogoV1](https://user-images.githubusercontent.com/71295634/111056805-04571c80-8450-11eb-89e6-1d9e5edc7ce2.png)

# MobileDev-Spring21

Most of you will be working inside of the Pages/"your assigned page".

If you use any external Flutter Plugins or Packages please put them on the the extension.txt file in the main directory of the repository.

# **UPDATE 3/5/2021**

None of the Flutter projects inside the Pages directory have been initialized. This means the app has not been built yet so when you get the chance, please clone the repository then "flutter run" it on your local machine. After you run it on your local machine, please use this order of git commands:

1. git status
2. git add Pages/{your page you're working on}
3. git commit -m "{Your message here informing team of any changes}"
4. git push

# **UPDATE 3/8/2021**

Implemented Firebase Auth for IOS and Android operating systems. Run 'flutter run' inside the 'p3_MAIN' folder.
  - User: user@gmail.com
  - password: password

Downgraded Firebase plugins to:
  - firebase_auth: ^0.20.1
  - firebase_core: ^0.7.0
  
In the 'main.dart' file inside the 'p3_MAIN' folder, 2 new preset text styles where added, alongside with the preset colors from FIU.
  
To use the colors enter: (if you're working in the p3_MAIN directory)
  - color: AppTheme.colors.NameOfColor
  - colors can be found inside /lib/theme/colors.dart

To use the preset text styles enter:
  - style: Theme.of(context).textTheme.bodyText1

Added login and home screen route to app.

# **UPDATE 3/10/2021**

Implemented the Resources and Information Page:
- Added url_launcher 6.0.2 to /p3_MAIN/pubspec.yaml file.
- Implemented URL Launcher.
- Set up the page routes to and from the resources page.

Mauricio and Felix are done with their pages: NEEDS to be reassigned.

# **UPDATE 3/13/2021**

Implemented Screening Checklist page 1 (incomplete as of writing). Problems with computer logic and OOP logic.

Added a 'On Campus/Workplace Guidelines Page' in lieu of the orginal updates tab for now.

Added a register with email and password for the login to implement the Firebase user records much more easier. When signing up you will be asked for an email, first/last name, password (along with a confirmation of the password). Upon registering 4 key value pairs are written within the Firebase database:
- email: 'string'
- exposure_id: 'string' => exposure ID is generated on press of the register button as long as all the other inputs are filled. Exposure ID is a 20 character long string that is random; this will be used by the contact tracing protocol that will be hopefully implemented.
- first_name: 'string'
- last_name: 'string'

**DO NOT SPAM THE REGISTER BUTTON WITH A BUNCH OF RANDOM EMAILS. FIREBASE WILL CHARGGE ME MONEY FOR EVERY READ AND WRITE THAT IS ABOVE A CERTAIN CAP.** After registering with all fields fill out it will redirect you back to the sign in page. Then with your newly created account, you can log in.

**TODO:** Implement some type of input validation.
