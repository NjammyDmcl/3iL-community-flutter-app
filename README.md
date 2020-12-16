# 3iL Community Flutter App (readme in writing)

An mobile application build to organise the **events**, **meet** and **projects** around 3iL club initiative, the goal here is to provide a client to consume data ressources manage by prebuilt backend services which already exist.

# Specifications

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

