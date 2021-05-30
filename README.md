<p align="center">
  <a href="" rel="noopener">
 <img src="https://github.com/Chinmay-KB/toe-tactic/blob/master/Banner.png" alt="Project banner"></a>
</p>
<h3 align="center">Toe Tac Tic</h3>

<div align="center">

[![Hackathon](https://img.shields.io/badge/hackathon-name-orange.svg)](http://hackathon.url.com)
[![Status](https://img.shields.io/badge/status-active-success.svg)]()
[![GitHub Issues](https://img.shields.io/github/issues/Chinmay-KB/toe-tactic.svg)](https://github.com/Chinmay-KB/toe-tactic/issues)
[![GitHub Pull Requests](https://img.shields.io/github/issues-pr/Chinmay-KB/toe-tactic.svg)](https://github.com/Chinmay-KB/toe-tactic/pulls)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE.md)

</div>

---

<p align="center"> Tic Tac Toe, with more tactic
    <br> 
</p>

## 📝 Table of Contents

- [Problem Statement](#problem_statement)
- [Idea / Solution](#idea)
- [Dependencies / Limitations](#limitations)
- [Future Scope](#future_scope)
- [Setting up a local environment](#getting_started)
- [Usage](#usage)
- [Technology Stack](#tech_stack)
- [Contributing](../CONTRIBUTING.md)
- [Authors](#authors)
- [Acknowledgments](#acknowledgments)

## 🧐 Problem Statement <a name = "problem_statement"></a>

Tic Tac Toe is widely popular because of its minimal requirements, any piece of paper and a pen would do. Most of my notebooks in school had the grid drawn in the last pages, and most of yours must have had it too. But we cannot enjoy tic tac toe for long enough as it is solvable. The person who has the first turn can force a draw at least, if not a win. With our little game, we aim to take that advantage away and make it a bit more interesting, without making it too complicated.

## 💡 Idea / How to play <a name = "idea"></a>

The plan
- Each player has 6 pieces (or dots as we like to call them).
- Each dot has a number assigned to it, 1 through 6.
- Let us say a dot is placed on the grid anywhere, let the number of that dot be `x`. Now the opponent can overrule that dot and occupy the same dot if they place a dot with a higher number `y` such that `y>x`.
- For eg- If player one has a dot of 3 in the center, player 2 can capture the center with a dot of 4 or higher.
- Final aim remains the same, get three in a row!

## 🚀 Future Scope <a name = "future_scope"></a>

We will be working on publishing it as a simple local multiplayer game and a bot mode too.

## 🏁 Getting Started <a name = "getting_started"></a>

- Clone the repo `git clone https://github.com/Chinmay-KB/toe-tactic`
- Run `cd toe-tactic`
- Run `flutter pub get` to fetch all the dependencies
- Run `flutter build apk --release` to get the release build
- Connect your device and run `flutter run` for debugging the app on your device.

### Prerequisites

Your 💓 for tic tac toe

### Installing

- Download the release apk from here [release apk](https://github.com/Chinmay-KB/toe-tactic/blob/master/app-release.apk)
- Install the apk. Play services may prompt you to not install the apk as it is not from playstore. Trust us and go ahead with the install 😉


## ⛏️ Built With <a name = "tech_stack"></a>

- [Flutter](https://www.flutter.dev) - App framework
- [Adobe XD](https://www.adobe.com/in/products/xd.html) - Wireframing

## ✍️ Authors <a name = "authors"></a>

- [Chinmay Kabi](https://github.com/Chinmay-KB) - Idea & developing the app.
- [Sonali Sahoo](https://github.com/Sonali710) - Designs and assets

## 🎉 Acknowledgments <a name = "acknowledgments"></a>

- [Misere tic tac toe](https://mindyourdecisions.com/blog/2016/11/01/the-best-first-move-in-misere-tic-tac-toe-3-in-a-row-is-losing-game-theory-tuesdays/) for getting us to thin of other ways we can make things interesting.
- Our school boredom for making us play enough tic tac toe!
