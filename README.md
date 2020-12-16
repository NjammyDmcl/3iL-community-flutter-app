# 3iL Community Flutter App (readme in writing)

An mobile application build to organise the **events**, **meet** and **projects** around 3iL club initiative, the goal here is to provide a client to consume data ressources manage by prebuilt backend services which already exist.

# Project Configuration

## Environment & Tools

 >  JDK 1.8 
 >
 >  SDK 
 >
 >  Framework : Flutter 1.22.4 • channel stable
 >
 >  Langage: Dart 2.10.4
 >
 >  Editor: VsCode

## Clone et run

After clone repos, we can do that for launch app:
 > flutter clean
 >
 > flutter pub get
 >
 > flutter run

# Project pecifications

We consider specification as basic function provides by app, and we organise in module:

 - User module
 - Meet module
 - Project module

## User Module

This module in point of view of application consist to provide:

 - User authentification (open/close session)
 - User account management 
	 - update user information
	 - update user password

Get like an uml entity, we decid to affect to this model the follow attributs:
```
	- name
	- degree
	- phone
	- member
	- password
	- session
```

