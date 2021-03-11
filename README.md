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

