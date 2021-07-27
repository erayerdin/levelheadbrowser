# Levelhead Browser

![GitHub Workflow Build Status](https://img.shields.io/github/workflow/status/erayerdin/levelheadbrowser/build?style=flat-square&label=build)
![GitHub Workflow Test Status](https://img.shields.io/github/workflow/status/erayerdin/levelheadbrowser/test?style=flat-square&label=tests)

An Android app to explore Levelhead universe.

 > ### ⚠️ Warning!
 >
 > This is not an official application by Butterscotch Shenanigans. I am not affiliated to them or working for them.

In this app, you can browse and filter profiles and levels. You can also check out tower trial and records as well.

Currently, this app is in alpha stage. You might encounter some unexpected behavior.

## Get the App

### Android

Levelhead Browser is now available on Google Play Store.

<a href='https://play.google.com/store/apps/details?id=com.erayerdin.levelheadbrowser&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1'><img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png'/></a>

### Linux

It is possible to build Levelhead Browser as native Linux application. We cannot share Linux app as binary (see [#1](https://github.com/erayerdin/levelheadbrowser/issues/1) and [flutter#85460](https://github.com/flutter/flutter/issues/85460) for details). So you can clone this repository and do `flutter run -d linux` to build and run the application.

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
