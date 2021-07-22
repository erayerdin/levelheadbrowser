# Levelhead Browser

![GitHub Workflow Build Status](https://img.shields.io/github/workflow/status/erayerdin/levelheadbrowser/build?style=flat-square&label=build)
![GitHub Workflow Test Status](https://img.shields.io/github/workflow/status/erayerdin/levelheadbrowser/test?style=flat-square&label=tests)

An Android application to browse levels, profiles, daily build levels and tower trial levels etc.

Currently, the application is in preview stage. [There is a devlog](https://www.youtube.com/watch?v=P9ChYHl8gdE&list=PLbJe7nxsM6nXbQnq1gq8DCw878A6FA-zb) **in Turkish** if you are interested.

## Downloads

Please remember that Levelhead Browser is still in preview stage and will not work as intended. However, there are regular builds you can still enjoy.

**Android APK:** [Click here](https://nightly.link/erayerdin/levelheadbrowser/workflows/build/master/android-apk.zip)

It is also possible to build Levelhead Browser as native Linux application. We cannot share Linux app as binary (see [#1](https://github.com/erayerdin/levelheadbrowser/issues/1)). So you can clone this repository and do `flutter run -d linux` to build and run the application.

## Features

### Profiles Page

- Grid-like info cards, the color of which is based on subscriber count
- Information dialog for each profile
- Sliding up filter panel

https://user-images.githubusercontent.com/2399084/126715646-21457db0-67cc-4b94-b754-b22a0924e57d.mp4

### Levels Page

- List-like info cards, the color of which is based on clear rate
- Information dialog for each level
  - Badges for informations such as exposure bucks, tags, required players etc.
- Sliding up filter panel

https://user-images.githubusercontent.com/2399084/126715696-f7622b55-0b61-4bbd-99ee-0fdd82ea1c1b.mp4

### Tower Trials Page

 - List-like info cards, the color of which is based on clear rate
 - Information dialog for each level such as exposure bucks, tags, required players, etc.
 - See fastest time and high score records on a separate slide-up panel.

https://user-images.githubusercontent.com/2399084/126715738-30f9131d-7659-43be-8f3a-9dd931b492cb.mp4

## License

This project is licensed under [Mozilla Public License 2.0](https://www.mozilla.org/en-US/MPL/2.0/).
