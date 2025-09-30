import 'package:flutter/material.dart';

class Animal {
  final String name;
  final String type;
  final double weight;
  final List<String> habitat;
  final int height;
  final List<String> activities;
  final String image;
  final String wikipedia;

  Animal(
      {required this.name,
      required this.type,
      required this.weight,
      required this.habitat,
      required this.height,
      required this.activities,
      required this.image,
      required this.wikipedia});
}

List<Animal> dummyAnimals = [
  Animal(
      name: "Bengal Tiger",
      type: "Mammal",
      weight: 220.5,
      habitat: ["Forest", "Grassland"],
      height: 110,
      activities: ["Hunting", "Roaming", "Sleeping"],
      image:
          "https://images.pexels.com/photos/2055100/pexels-photo-2055100.jpeg",
      wikipedia: "https://en.wikipedia.org/wiki/Bengal_tiger"),
  Animal(
      name: "Komodo Dragon",
      type: "Reptile",
      weight: 90.2,
      habitat: ["Island", "Dry Forest"],
      height: 70,
      activities: ["Basking", "Hunting", "Exploring"],
      image:
          "https://images.pexels.com/photos/2664272/pexels-photo-2664272.jpeg",
      wikipedia: "https://en.wikipedia.org/wiki/Komodo_dragon"),
  Animal(
    name: "African Grey Parrot",
    type: "Bird",
    weight: 0.4,
    habitat: ["Rainforest"],
    height: 33,
    activities: ["Flying", "Mimicking", "Eating Seeds"],
    image: "https://images.pexels.com/photos/97533/pexels-photo-97533.jpeg",
    wikipedia: "https://en.wikipedia.org/wiki/African_grey_parrot",
  ),
  Animal(
    name: "Green Sea Turtle",
    type: "Reptile",
    weight: 160.0,
    habitat: ["Ocean", "Coastal"],
    height: 120,
    activities: ["Swimming", "Diving", "Resting"],
    image: "https://images.pexels.com/photos/2289462/pexels-photo-2289462.jpeg",
    wikipedia: "https://en.wikipedia.org/wiki/Green_sea_turtle",
  ),
  Animal(
    name: "Siberian Husky",
    type: "Dog",
    weight: 27.0,
    habitat: ["Domestic"],
    height: 60,
    activities: ["Running", "Pulling Sled", "Playing"],
    image: "https://images.pexels.com/photos/245035/pexels-photo-245035.jpeg",
    wikipedia: "https://en.wikipedia.org/wiki/Siberian_Husky",
  ),
  Animal(
    name: "Giant Panda",
    type: "Mammal",
    weight: 100.0,
    habitat: ["Bamboo Forest"],
    height: 75,
    activities: ["Eating Bamboo", "Climbing", "Sleeping"],
    image:
        "https://images.pexels.com/photos/32607009/pexels-photo-32607009.jpeg",
    wikipedia: "https://en.wikipedia.org/wiki/Giant_panda",
  ),
];