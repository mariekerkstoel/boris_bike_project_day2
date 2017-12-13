**Transport for London, the body responsible for delivery of a new bike system, come to you with a plan: a network of docking stations and bikes that anyone can use. They want you to build a program that will emulate all the docking stations, bikes, and infrastructure (repair staff, and so on) required to make their dream a reality.**

***
### Description
Simple ruby program with rspec testing framework. No gems, no back-end.

### Domain models
Below are some domain models representing

#### User story nouns
Person, bike, docking stations

#### User story verbs
Use (bike), release (bike), check (bike)

#### User story tables
| Object | Messages |
|---|---|
|Person| |
|Bike | working? |
|DockingStation | release_bike |

#### User story diagrams
Person -> check_bike -> Bike
Docking_Station -> release_bike -> Bike  
