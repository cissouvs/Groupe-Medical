//
//  MockPlaces.swift
//  Memora
//
//  Created by Leskeu  on 06/08/2026.
//

import Foundation

//var contactPlace: [Place] = [
//    Place(image: <#T##String#>, name: <#T##String#>, adresse: <#T##String#>, detail: <#T##String#>),
//    Place(image: <#T##String#>, name: <#T##String#>, adresse: <#T##String#>, detail: <#T##String#>),
//    Place(image: <#T##String#>, name: <#T##String#>, adresse: <#T##String#>, detail: <#T##String#>),
//    Place(image: <#T##String#>, name: <#T##String#>, adresse: <#T##String#>, detail: <#T##String#>),
//    Place(image: <#T##String#>, name: <#T##String#>, adresse: <#T##String#>, detail: <#T##String#>)
//]
//
//var emergencyPlace: [Place] = [
//    Place(image: <#T##String#>, name: <#T##String#>, adresse: <#T##String#>, detail: <#T##String#>),
//    Place(image: <#T##String#>, name: <#T##String#>, adresse: <#T##String#>, detail: <#T##String#>),
//    Place(image: <#T##String#>, name: <#T##String#>, adresse: <#T##String#>, detail: <#T##String#>),
//    Place(image: <#T##String#>, name: <#T##String#>, adresse: <#T##String#>, detail: <#T##String#>),
//    Place(image: <#T##String#>, name: <#T##String#>, adresse: <#T##String#>, detail: <#T##String#>)
//]
//
//var favoritePlace: [Place] = [
//    Place(image: <#T##String#>, name: <#T##String#>, adresse: <#T##String#>, detail: <#T##String#>),
//    Place(image: <#T##String#>, name: <#T##String#>, adresse: <#T##String#>, detail: <#T##String#>),
//    Place(image: <#T##String#>, name: <#T##String#>, adresse: <#T##String#>, detail: <#T##String#>),
//    Place(image: <#T##String#>, name: <#T##String#>, adresse: <#T##String#>, detail: <#T##String#>),
//    Place(image: <#T##String#>, name: <#T##String#>, adresse: <#T##String#>, detail: <#T##String#>)
//]

var contactPlace: [Place] = [
    Place(
        image: "mediatheque",
        name: "Médiathèque Intercommunale du Quercy Blanc",
        adresse: "6 Place de la Halle aux Grains, 46800 Montcuq",
        detail: "Médiathèque calme proposant livres, animations et espace de lecture.",
        coordinate: mediathequePosition
    ),
    Place(
        image: "",
        name: "Plan d'eau de Montcuq",
        adresse: "Route de Fumel, 46800 Montcuq",
        detail: "Lieu idéal pour une promenade au bord de l'eau avec de nombreux bancs.",
        coordinate: planEauPosition
    ),
    Place(
        image: "",
        name: "Café de France",
        adresse: "5 Place de la République, 46800 Montcuq",
        detail: "Café convivial sur la place du village, parfait pour se retrouver.",
        coordinate: cafeFrancePosition
    ),
    Place(
        image: "",
        name: "Salle des Aînés",
        adresse: "Allée des Marronniers, 46800 Montcuq",
        detail: "Salle municipale accueillant des rencontres et activités pour les seniors.",
        coordinate: salleAinesPosition
    ),
    Place(
        image: "",
        name: "Tour de Montcuq",
        adresse: "11 Rue du Tour de la Vieille Ville, 46800 Montcuq",
        detail: "Monument historique accessible avec une agréable promenade dans le village.",
        coordinate: tourMontcuqPosition
    )
]

var emergencyPlace: [Place] = [
    Place(
        image: "pharmacie",
        name: "Pharmacie de Montcuq",
        adresse: "7 Place de la République, 46800 Montcuq-en-Quercy-Blanc",
        detail: "Pharmacie proposant médicaments, matériel médical et conseils de santé.",
        coordinate: pharmaciePosition
    ),
    Place(
        image: "placeholder",
        name: "Maison de Santé",
        adresse: "Allée des Marronniers, 46800 Montcuq-en-Quercy-Blanc",
        detail: "Médecins généralistes, infirmiers et professionnels de santé regroupés dans un même établissement.",
        coordinate: maisonSantePosition
    ),
    Place(
        image: "placeholder",
        name: "Caserne de Pompiers",
        adresse: "Route de Cahors, 46800 Montcuq-en-Quercy-Blanc",
        detail: "Service de secours des sapeurs-pompiers pour les situations d'urgence.",
        coordinate: pompiersPosition
    ),
    Place(
        image: "placeholder",
        name: "Gendarmerie",
        adresse: "Rue du Stade, 46800 Montcuq-en-Quercy-Blanc",
        detail: "Accueil du public, assistance et interventions en cas d'urgence.",
        coordinate: gendarmeriePosition
    ),
    Place(
        image: "placerholder",
        name: "Centre Hospitalier",
        adresse: "335 Rue du Président de Wilson, 46000 Cahors",
        detail: "Hôpital de référence le plus proche avec service d'urgences ouvert 24h/24.",
        coordinate: hopitalCahorsPosition
    )
]

var favoritePlace: [Place] = [
    Place(
        image: "placeholder",
        name: "Médiathèque Intercommunale du Quercy Blanc",
        adresse: "6 Place de la Halle aux Grains, 46800 Montcuq",
        detail: "Endroit paisible pour lire et participer à des animations culturelles.",
        coordinate: mediathequePosition
    ),
    Place(
        image: "placeholder",
        name: "Quercy Blanc",
        adresse: "46800 Montcuq",
        detail: "Magnifiques paysages propices aux promenades et à la détente.",
        coordinate: quercyBlancPosition
    ),
    Place(
        image: "placeholder",
        name: "Café, Pain & Épicerie",
        adresse: "22 Rue du Faubourg Saint-Privat, 46800 Montcuq",
        detail: "Petit café de quartier agréable pour le petit-déjeuner ou une pause.",
        coordinate: cafePainPosition
    ),
    Place(
        image: "placeholder",
        name: "Aquazone Montcuq",
        adresse: "Chemin de la Plage, 46800 Montcuq",
        detail: "Base de loisirs avec un environnement calme autour du lac.",
        coordinate: aquazonePosition
    ),
    Place(
        image: "placeholder",
        name: "Centre historique de Montcuq",
        adresse: "46800 Montcuq",
        detail: "Charmantes ruelles médiévales idéales pour une promenade tranquille.",
        coordinate: centreHistoriquePosition
    )
]
