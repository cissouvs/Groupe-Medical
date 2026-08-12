//
//  PlacesListViewModel.swift
//  Memora
//
//  Created by Leskeu  on 07/08/2026.
//

import Foundation

var allPlaces: [Place] = [
    Place(
        picture: "https://mairie-montcuq-en-quercy-blanc.fr/wp-content/uploads/2024/03/mediatheque_mtq.jpg",
        name: "Médiathèque Intercommunale du Quercy Blanc",
        adresse: "6 Place de la Halle aux Grains, 46800 Montcuq",
        detail: "Médiathèque calme proposant livres, animations et espace de lecture.",
        coordinate: mediathequePosition,
        places: .contact
    ),
    Place(
        picture: "https://cdt46.media.tourinsoft.eu/upload/20200630-130541.jpg",
        name: "Plan d'eau de Montcuq",
        adresse: "Route de Fumel, 46800 Montcuq",
        detail: "Lieu idéal pour une promenade au bord de l'eau avec de nombreux bancs.",
        coordinate: planEauPosition,
        places: .contact
    ),
    Place(
        picture: "https://static.wixstatic.com/media/b5f504_30200c63572a4129afb279839ff02214~mv2.jpg/v1/fit/w_2500,h_1330,al_c/b5f504_30200c63572a4129afb279839ff02214~mv2.jpg",
        name: "Café de France",
        adresse: "5 Place de la République, 46800 Montcuq",
        detail: "Café convivial sur la place du village, parfait pour se retrouver.",
        coordinate: cafeFrancePosition,
        places: .contact
    ),
    Place(
        picture: "https://images.ladepeche.fr/api/v1/images/view/640c014d695ac027430fc4c4/large/image.jpg?v=1",
        name: "Salle des Aînés",
        adresse: "Allée des Marronniers, 46800 Montcuq",
        detail: "Salle municipale accueillant des rencontres et activités pour les seniors.",
        coordinate: salleAinesPosition,
        places: .contact
    ),
    Place(
        picture: "https://upload.wikimedia.org/wikipedia/commons/7/7f/Montcuq_-_Tour_-6.JPG?utm_source=fr.wikipedia.org&utm_campaign=index&utm_content=original",
        name: "Tour de Montcuq",
        adresse: "11 Rue du Tour de la Vieille Ville, 46800 Montcuq",
        detail: "Monument historique accessible avec une agréable promenade dans le village.",
        coordinate: tourMontcuqPosition,
        places: .contact
    ),
    Place(
        picture: "https://annuaire.pharmao.fr/img/pharmacies/9823.jpg",
        name: "Pharmacie de Montcuq",
        adresse: "7 Place de la République, 46800 Montcuq-en-Quercy-Blanc",
        detail: "Pharmacie proposant médicaments, matériel médical et conseils de santé.",
        coordinate: pharmaciePosition,
        places: .emergency
    ),
    Place(
        picture: "https://www.ccquercyblanc.fr/wp-content/uploads/2022/04/maison-medicale-montcuq.jpg",
        name: "Maison de Santé",
        adresse: "Allée des Marronniers, 46800 Montcuq-en-Quercy-Blanc",
        detail: "Médecins généralistes, infirmiers et professionnels de santé regroupés dans un même établissement.",
        coordinate: maisonSantePosition,
        places: .emergency
    ),
    Place(
        picture: "https://cdn.lepetitjournal.net/uploads/2024/06/FB_IMG_1717866719558.jpg",
        name: "Caserne de Pompiers",
        adresse: "Route de Cahors, 46800 Montcuq-en-Quercy-Blanc",
        detail: "Service de secours des sapeurs-pompiers pour les situations d'urgence.",
        coordinate: pompiersPosition,
        places: .emergency
    ),
    Place(
        picture: "https://images.ladepeche.fr/api/v1/images/view/5c24d2998fe56f093c50db48/large/image.jpg",
        name: "Gendarmerie",
        adresse: "Rue du Stade, 46800 Montcuq-en-Quercy-Blanc",
        detail: "Accueil du public, assistance et interventions en cas d'urgence.",
        coordinate: gendarmeriePosition,
        places: .emergency
    ),
    Place(
        picture: "https://www.pagesjaunes.fr/media/newdam/2c/84/74/00/00/f9/7f/0f/76/2c/62602c84740000f97f0f762c/62602c85740000f97f0f762e.jpg",
        name: "Centre Hospitalier",
        adresse: "335 Rue du Président de Wilson, 46000 Cahors",
        detail: "Hôpital de référence le plus proche avec service d'urgences ouvert 24h/24.",
        coordinate: hopitalCahorsPosition,
        places: .emergency
    ),
    Place(
        picture: "placeholder",
        name: "Médiathèque Intercommunale du Quercy Blanc",
        adresse: "6 Place de la Halle aux Grains, 46800 Montcuq",
        detail: "Endroit paisible pour lire et participer à des animations culturelles.",
        coordinate: mediathequePosition,
        places: .favorite
    ),
    Place(
        picture: "https://www.cahorsvalleedulot.com/wp-content/uploads/2021/12/montcuq-lot-tourisme-dronexplorer-a-calvayrac-151001-085751-2-redim-550x412-1640852757.jpg",
        name: "Quercy Blanc",
        adresse: "46800 Montcuq",
        detail: "Magnifiques paysages propices aux promenades et à la détente.",
        coordinate: quercyBlancPosition,
        places: .favorite
    ),
    Place(
        picture: "https://static.actu.fr/uploads/2021/03/25511-210310112756355-0-960x640.jpg",
        name: "Café, Pain & Épicerie",
        adresse: "22 Rue du Faubourg Saint-Privat, 46800 Montcuq",
        detail: "Petit café de quartier agréable pour le petit-déjeuner ou une pause.",
        coordinate: cafePainPosition,
        places: .favorite
    ),
    Place(
        picture: "https://www.cahorsvalleedulot.com/wp-content/uploads/external/c88854aabc3b7701088a7f1ca1be216f-Aquazone-Photo-1600x0.png",
        name: "Aquazone Montcuq",
        adresse: "Chemin de la Plage, 46800 Montcuq",
        detail: "Base de loisirs avec un environnement calme autour du lac.",
        coordinate: aquazonePosition,
        places: .favorite
    ),
    Place(
        picture: "https://leperchoirduquercy.fr/wp-content/uploads/2025/07/rue-montmartre-montcuq.webp",
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
