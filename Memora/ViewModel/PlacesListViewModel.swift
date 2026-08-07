//
//  PlacesListViewModel.swift
//  Memora
//
//  Created by Leskeu  on 07/08/2026.
//

import Foundation

var allPlaces: [Place] = [
    Place(
        image: "mediatheque",
        name: "Médiathèque Intercommunale du Quercy Blanc",
        adresse: "6 Place de la Halle aux Grains, 46800 Montcuq",
        detail: "Médiathèque calme proposant livres, animations et espace de lecture.",
        coordinate: mediathequePosition,
        places: .contact
    ),
    Place(
        image: "placeholder",
        name: "Plan d'eau de Montcuq",
        adresse: "Route de Fumel, 46800 Montcuq",
        detail: "Lieu idéal pour une promenade au bord de l'eau avec de nombreux bancs.",
        coordinate: planEauPosition,
        places: .contact
    ),
    Place(
        image: "placeholder",
        name: "Café de France",
        adresse: "5 Place de la République, 46800 Montcuq",
        detail: "Café convivial sur la place du village, parfait pour se retrouver.",
        coordinate: cafeFrancePosition,
        places: .contact
    ),
    Place(
        image: "placeholder",
        name: "Salle des Aînés",
        adresse: "Allée des Marronniers, 46800 Montcuq",
        detail: "Salle municipale accueillant des rencontres et activités pour les seniors.",
        coordinate: salleAinesPosition,
        places: .contact
    ),
    Place(
        image: "placeholder",
        name: "Tour de Montcuq",
        adresse: "11 Rue du Tour de la Vieille Ville, 46800 Montcuq",
        detail: "Monument historique accessible avec une agréable promenade dans le village.",
        coordinate: tourMontcuqPosition,
        places: .contact
    ),
    Place(
        image: "pharmacie",
        name: "Pharmacie de Montcuq",
        adresse: "7 Place de la République, 46800 Montcuq-en-Quercy-Blanc",
        detail: "Pharmacie proposant médicaments, matériel médical et conseils de santé.",
        coordinate: pharmaciePosition,
        places: .emergency
    ),
    Place(
        image: "placeholder",
        name: "Maison de Santé",
        adresse: "Allée des Marronniers, 46800 Montcuq-en-Quercy-Blanc",
        detail: "Médecins généralistes, infirmiers et professionnels de santé regroupés dans un même établissement.",
        coordinate: maisonSantePosition,
        places: .emergency
    ),
    Place(
        image: "placeholder",
        name: "Caserne de Pompiers",
        adresse: "Route de Cahors, 46800 Montcuq-en-Quercy-Blanc",
        detail: "Service de secours des sapeurs-pompiers pour les situations d'urgence.",
        coordinate: pompiersPosition,
        places: .emergency
    ),
    Place(
        image: "placeholder",
        name: "Gendarmerie",
        adresse: "Rue du Stade, 46800 Montcuq-en-Quercy-Blanc",
        detail: "Accueil du public, assistance et interventions en cas d'urgence.",
        coordinate: gendarmeriePosition,
        places: .emergency
    ),
    Place(
        image: "placerholder",
        name: "Centre Hospitalier",
        adresse: "335 Rue du Président de Wilson, 46000 Cahors",
        detail: "Hôpital de référence le plus proche avec service d'urgences ouvert 24h/24.",
        coordinate: hopitalCahorsPosition,
        places: .emergency
    ),
    Place(
        image: "placeholder",
        name: "Médiathèque Intercommunale du Quercy Blanc",
        adresse: "6 Place de la Halle aux Grains, 46800 Montcuq",
        detail: "Endroit paisible pour lire et participer à des animations culturelles.",
        coordinate: mediathequePosition,
        places: .favorite
    ),
    Place(
        image: "placeholder",
        name: "Quercy Blanc",
        adresse: "46800 Montcuq",
        detail: "Magnifiques paysages propices aux promenades et à la détente.",
        coordinate: quercyBlancPosition,
        places: .favorite
    ),
    Place(
        image: "placeholder",
        name: "Café, Pain & Épicerie",
        adresse: "22 Rue du Faubourg Saint-Privat, 46800 Montcuq",
        detail: "Petit café de quartier agréable pour le petit-déjeuner ou une pause.",
        coordinate: cafePainPosition,
        places: .favorite
    ),
    Place(
        image: "placeholder",
        name: "Aquazone Montcuq",
        adresse: "Chemin de la Plage, 46800 Montcuq",
        detail: "Base de loisirs avec un environnement calme autour du lac.",
        coordinate: aquazonePosition,
        places: .favorite
    ),
    Place(
        image: "placeholder",
        name: "Centre historique de Montcuq",
        adresse: "46800 Montcuq",
        detail: "Charmantes ruelles médiévales idéales pour une promenade tranquille.",
        coordinate: centreHistoriquePosition,
        places: .favorite
    )
]

@Observable
final class PlacesListViewModel {
    var places : [Place] = allPlaces
    
    var selectedFilter: DifferentPlaces = .tous
    
    var filteredPlaces: [Place] {
        if selectedFilter == .tous {
            return places
        }
        return places.filter {
            $0.places == selectedFilter
        }
    }
    
    func getPlace(id: UUID) -> Place {
        let placeIndex =
        places.firstIndex(where: { $0.id == id})!
        return places[placeIndex]
    }
    
}
