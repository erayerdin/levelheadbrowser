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

https://user-images.githubusercontent.com/2399084/127312639-24742ae8-4955-4e1b-9ad2-b1367a1e2285.mp4

### Levels Page

- List-like info cards, the color of which is based on clear rate
- Information dialog for each level
  - Badges for informations such as exposure bucks, tags, required players etc.
- Sliding up filter panel

https://user-images.githubusercontent.com/2399084/127312688-8330d873-e392-4f27-890e-4a2345ce9a3a.mp4

### Tower Trials Page

 - List-like info cards, the color of which is based on clear rate
 - Information dialog for each level such as exposure bucks, tags, required players, etc.
 - See fastest time and high score records on a separate slide-up panel.

https://user-images.githubusercontent.com/2399084/127312715-383705f2-0a67-4eac-98b7-577cf01e5fc4.mp4

### In-App Links

You can share, copy and generate in-app links. The format for in-app link is:

```plain
// for profiles
lhbr://profile/{id}

// for levels
lhbr://level/{id}
```

Clicking a link with `lhbr` scheme will launch Levelhead Browser and will take you to related level or profile.

You can also share or copy the link of a specific level or profile in its detail dialog.

## License

This project is licensed under [Mozilla Public License 2.0](https://www.mozilla.org/en-US/MPL/2.0/).
