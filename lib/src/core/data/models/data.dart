//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/constants/app_colors.dart';
//import 'package:flutter_movie_app/src/core/data/models/parking_location.dart';
import 'package:flutter_movie_app/src/core/data/models/parking_date.dart';
import 'package:flutter_movie_app/src/core/data/models/spot_label.dart';
//import 'package:flutter_movie_app/src/core/data/models/section_spot.dart';
//import 'package:flutter_movie_app/src/core/data/models/spot.dart';

import 'category.dart';
import 'parking.dart';

final parkingDates = ParkingDate('Mar', 1,
    ['09:00', '10:30', '11:30', '13:00', '15:00', '17:30', '18:30', '20:30']);

final seatLabels = [
  SpotLabel('Available', Colors.grey),
  SpotLabel('Handicap', AppColors.principalColor),
  SpotLabel('Reserved', Colors.white),
];

final categories = [
  Category(
    name: "Car",
    icon: "🚗",
  ),
  Category(
    name: "Taxi",
    icon: "🚕",
  ),
  Category(
    name: "Motocycle",
    icon: "🏍",
  ),
  Category(
    name: "Scooter",
    icon: "🛵",
  ),
  Category(
    name: "Bike",
    icon: "🚲",
  ),
  Category(
    name: "Bus",
    icon:"🚌",
  ),
];

final parkings = [
  Parking(
    dates: parkingDates,
  //  location: parkingLocation[0],
    name: "Sousse fair",
    duractionMinutes: '1h 30m',
    gender: "Fiction",
    picture: "hp1.jpg",
    raiting: 8.7,
    description:
    "La société Foire Internationale de Sousse, crée le 3 Avril 1955, se situe à proximité de la ville de Sousse, près du port de la ville de Sousse, à 10 mn de l’aéroport de la ville de Monastir. La société Foire Internationale de Sousse reflète un aspect moderne, du fait que l’espace d’exposition est très bien équipée par toutes les commodités (électricité, équipements des stands, climatisation, location de matériel…) tout en gardant l’esprit national et la sensation de retour à l’origine. La société organise chaque année plus que 20 évènements nationaux et internationaux."
  ),
  Parking(
    dates: parkingDates,
   // location: parkingLocation[0],
    name: "Mall of Sousse",
    duractionMinutes: '1h 30m',
    gender: "Fiction",
    picture: "hp2.jpg",
    raiting: 9.7,
      description:
      "D’une superficie supérieure à 130 mille mètres carrés couverts, Mall of Sousse est le plus grand centre de shopping et de loisirs de Tunisie. Il a été conçu selon les mêmes standards que ceux adoptés par les Malls les plus récents dans le monde. Il tire profit d’un emplacement stratégique au cœur de la région du Sahel à seulement cinq minutes de la zone touristique d’El Kantaoui."
  ),
  Parking(
    dates: parkingDates,
    //location: parkingLocation[0],
    name: "Medetraniere Clinic",
    duractionMinutes: '1h 30m',
    gender: "Fiction",
    picture: "hp3.jpg",
    raiting: 7.7,
    description:
      "La Clinique Méditerranéenne, Tunis est un hôpital multidisciplinaire situé en Tunisie. L'hôpital est spécialisé dans l'ensemble de la structure de santé en termes de services et de technologies haut de gamme, notamment la chirurgie orthopédique, la radiologie, la chirurgie esthétique, la chirurgie générale, le service d'urgence 24 heures sur XNUMX, la chirurgie ambulatoire, la gynécologie et l'obstétrique, et bien d'autres. La clinique est bien équipée avec les dernières options de traitement et comprend des médecins parfaitement formés et près de 300 infirmières possédant une vaste expérience."
  ),
  Parking(
    dates: parkingDates,
   // location: parkingLocation[0],
    name: "Tunisia Mall",
    duractionMinutes: '1h 30m',
    gender: "Fiction",
    picture: "hp4.jpg",
    raiting: 8.5,
    description:
  "Tunisia Mall est le plus grand centre commercial en Tunisie et un des plus grands centres commerciaux d’Afrique. Tunisia Mall s’étend sur une superficie de près de 6000 mètres carrés au sol et comprend plus de 80 commerces et boutiques pour faire du shopping, et passer un bon moment avec la famille, il comprend également un parking sous-sol ."
  ),
  Parking(
    dates: parkingDates,
    //location: parkingLocation[0],
    name: "Carthage Airport",
    duractionMinutes: '1h 30m',
    gender: "Fiction",
    picture: "hp5.jpg",
    raiting: 6.7,
    description: "L'aéroport international de Tunis-Carthage  dessert Tunis, la capitale de la Tunisie, et sa région. Situé à huit kilomètres au nord-est de Tunis, il est mis en exploitation en 1940. L'aéroport porte le nom de la cité historique de Carthage qui est située à l'est de l'aéroport. Lors de sa mise en exploitation, l'aérodrome est connu sous le nom de Tunis-El Aouina. "
  ),
  Parking(
    dates: parkingDates,
    //location: parkingLocation[0],
    name: "Sfax Mall",
    duractionMinutes: '1h 30m',
    gender: "Fiction",
    picture: "hp6.jpg",
    raiting: 9.7,
    description:
        "En medio de los desastres que azotan a Inglaterra por ataques de Voldemort y sus mortífagos hacia muggles, Harry y sus compañeros vuelven a Hogwarts para cursar su sexto año de estudios. Se le asigna a Draco Malfoy una misión por parte de Voldemort y Snape jura protegerlo y realizar la misión del chico si este es incapaz de realizarla.A pesar de las medidas de seguridad que han convertido al colegio en una fortaleza para evitar cualquier entrometimiento de fuerzas malignas, algunos estudiantes son víctimas de ataques inexplicables. Asimismo, Harry encuentra un libro de pociones cuyo propietario es el «príncipe mestizo», que lo ayuda durante todo el año. Dumbledore y el protagonista exploran el pasado de lord Voldemort mediante recuerdos que el director ha recolectado pues desea preparar al muchacho para la batalla final. Gracias a una memoria de Horace Slughorn, a Dumbledore y Harry se les revela que Voldemort dividió su alma en siete objetos llamados «horrocruxes» con el objetivo de esquivar a la muerte. Después de una intensa búsqueda de alguno de estos últimos, Dumbledore es asesinado por Snape, poniendo en duda la verdadera lealtad del asesino y entregando el poder máximo a manos de Voldemort para su segundo intento de dominio del mundo mágico. Snape le cuenta a Harry que el es el Príncipe Mestizo.",
  ),
  Parking(
    dates: parkingDates,
    //location: parkingLocation[0],
    name: "Geant city Mall",
    duractionMinutes: '1h 30m',
    gender: "Fiction",
    picture: "hp7.jpg",
    raiting: 9.7,
    description:
      "Géant, le plus grand hypermarché de la Tunisie a ouvert ses portes pour la première fois le 29 septembre 2005 et suite au sinistre du 12 Janvier 2011, a ré-ouvert ses portes le 12 janvier 2012. L’Hypermarché Géant, avec une superficie de 12000 m² demeure aujourd’hui la plus grande surface de vente en Tunisie."
  ),
  Parking(
    dates: parkingDates,
   // location: parkingLocation[0],
    name: "Enfidha Airport",
    duractionMinutes: '1h 30m',
    gender: "Fiction",
    picture: "hp8.jpg",
    raiting: 9.7,
    description:
        "Tras varios meses en busca de Horrocruxes y escondiéndose de los mortífagos por Inglaterra, Harry, Ron y Hermione regresan al Colegio Hogwarts al descubrir la existencia de otra parte del alma de Voldemort, allí Harry descubre que todo lo sucedido desde que fue entregado a sus tíos Dursley fue nada menos que un plan de Albus Dumbledore en donde cuidaba a Harry para su inminente final pensado y que la muerte de Albus Dumbledore fue planeado por el mismo Dumbledore y la verdadera rivalidad entre el padre de Harry (James Potter) y Severus Snape, pero en medio de su búsqueda de horrocruxes se desata la batalla final.",
  )
];
