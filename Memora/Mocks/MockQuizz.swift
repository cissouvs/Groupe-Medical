//
//  MockQuestion.swift
//  Memora
//
//  Created by apprenant92 on 30/07/2026.
//

import Foundation
var familyQuizz = Quizz(
    title: "Quiz de famille",
    category: .family,
    questions: [
        Question(
            question: "Quand est l'anniversaire de Théo ?",
            guesses: [
                "Le 9 juin 1997",
                "Le 10 janvier 1997",
                "Le 28 juillet 1997",
                "Le 15 avril 1997"
            ],
            rightAnswerIndex: [0],
            IsAnswerCorrect: false
        ),
        Question(
            question: "Où habite Gillian ?",
            guesses: [
                "Marseille",
                "Paris",
                "Bordeaux",
                "Montcuq"
            ],
            rightAnswerIndex: [3],
            IsAnswerCorrect: false
        ),
        Question(
            question: "Qui est Cyriac pour toi ?",
            guesses: [
                "Ton petit fils",
                "Ton fils",
                "Ton marie",
                "Ton médecin"
            ],
            rightAnswerIndex: [1],
            IsAnswerCorrect: false
        ),
        Question(
            question: "Combien as-tu de petits enfants ?",
            guesses: [
                "1",
                "3",
                "7",
                "11"
            ],
            rightAnswerIndex: [2],
            IsAnswerCorrect: false
        ),
        Question(
            question: "Ambre est elle ?",
            guesses: [
                "Mariée",
                "Enceinte",
                "La fille de Louis",
                "Morte"
            ],
            rightAnswerIndex: [2,3],
            IsAnswerCorrect: false
        ),
        Question(
            question: "Qui as fait des études d'architecture ?",
            guesses: [
                "Théo",
                "Cyriac",
                "Gillian",
                "Louis"
            ],
            rightAnswerIndex: [1],
            IsAnswerCorrect: false
        )
    ],
    isCompleted: false
)

var activityQuizz = Quizz(
    title: "Quiz sur les différentes activitées que tu as fais",
    category: .activity,
    questions: [
        Question(
            question: "Quelle activité aimes-tu faire le dimanche ?",
            guesses: [
                "Faire une promenade",
                "Faire du parachutisme",
                "Jouer au golf",
                "Faire de la plongée"
            ],
            rightAnswerIndex: [2],
            IsAnswerCorrect: false
        ),
        Question(
            question: "Quelle activité fais-tu souvent avec ta famille ?",
            guesses: [
                "Regarder un film",
                "Faire de l'escalade",
                "Faire du ski",
                "Faire du surf"
            ],
            rightAnswerIndex: [0,1],
            IsAnswerCorrect: false
        ),
        Question(
            question: "Quelle activité fais-tu lorsque tu retrouves tes amis ?",
            guesses: [
                "Boire un café ensemble",
                "Faire du voley",
                "Faire du ski",
                "Faire de la voile"
            ],
            rightAnswerIndex: [0,1],
            IsAnswerCorrect: false
        ),
        Question(
            question: "Aimes-tu faire des promenades ?",
            guesses: [
                "Oui, souvent",
                "Non, jamais",
                "Seulement la nuit",
                "Uniquement en hiver"
            ],
            rightAnswerIndex: [3],
            IsAnswerCorrect: false
        ),
        Question(
            question: "Que fais-tu généralement lorsque tu écoutes de la musique ?",
            guesses: [
                "Tu chantes",
                "Tu cuisines",
                "Tu dors",
                "Tu lis"
            ],
            rightAnswerIndex: [1],
            IsAnswerCorrect: false
        ),
        Question(
            question: "Quelle activité aimais-tu faire quand tu étais plus jeune ?",
            guesses: [
                "Faire du vélo",
                "Faire du surf",
                "Faire du ski nautique",
                "Faire du parapente"
            ],
            rightAnswerIndex: [0],
            IsAnswerCorrect: false
        )
    ],
    isCompleted: false
)

var mealQuizz = Quizz(
    title: "Quizz sur tes repas et aliments préféré",
    category: .meal,
    questions: [
        Question(
            question: "Qu'as-tu mangé hier matin ?",
            guesses: [
                "Du pain et du beurre",
                "Des pâtes",
                "Une salade",
                "Du poisson"
            ],
            rightAnswerIndex: [2],
            IsAnswerCorrect: false
        ),
        Question(
            question: "Qu'as-tu mangé hier midi ?",
            guesses: [
                "Du poulet avec des légumes",
                "Une soupe",
                "Des crêpes",
                "Une pizza"
            ],
            rightAnswerIndex: [3],
            IsAnswerCorrect: false
        ),
        Question(
            question: "Quel dessert manges-tu souvent après le repas ?",
            guesses: [
                "Du fromage",
                "Une compote",
                "Une salade",
                "Du pain"
            ],
            rightAnswerIndex: [1],
            IsAnswerCorrect: false
        ),
        Question(
            question: "Quel aliment n'aimes-tu pas particulièrement ?",
            guesses: [
                "Les épinards",
                "Les pommes",
                "Le chocolat",
                "Les fraises"
            ],
            rightAnswerIndex: [2],
            IsAnswerCorrect: false
        ),
        Question(
            question: "Qu'aimes-tu boire au petit-déjeuner ?",
            guesses: [
                "Du café",
                "De l'eau",
                "Du jus d'orange",
                "Du thé"
            ],
            rightAnswerIndex: [3],
            IsAnswerCorrect: false
        ),
        Question(
            question: "Quel plat as-tu l'habitude de manger en famille ?",
            guesses: [
                "Le poulet rôti",
                "La pizza",
                "Le couscous",
                "Le gratin"
            ],
            rightAnswerIndex: [0],
            IsAnswerCorrect: false
        )
    ],
    isCompleted: false
)
    
var placesVisitedQuizz = Quizz(
    title: "Quiz des endroits que tu as visité",
    category: .placesVisited,
    questions: [
        Question(
            question: "Quel endroit as-tu visité récemment ?",
            guesses: [
                "Paris",
                "Lyon",
                "Bordeaux",
                "Nice"
            ],
            rightAnswerIndex: [3],
            IsAnswerCorrect: false
        ),
        Question(
            question: "Dans quelle ville es-tu déjà parti(e) en vacances ?",
            guesses: [
                "Marseille",
                "Lille",
                "Toulouse",
                "Nantes"
            ],
            rightAnswerIndex: [0],
            IsAnswerCorrect: false
        ),
        Question(
            question: "Avec qui es-tu parti(e) en vacances la dernière fois ?",
            guesses: [
                "Ta famille",
                "Tes amis",
                "Tes collègues",
                "Tu es parti(e) seul(e)"
            ],
            rightAnswerIndex: [0],
            IsAnswerCorrect: false
        ),
        Question(
            question: "Quel endroit as-tu particulièrement aimé visiter ?",
            guesses: [
                "La mer",
                "La montagne",
                "La campagne",
                "Une grande ville"
            ],
            rightAnswerIndex: [1,2],
            IsAnswerCorrect: false
        ),
        Question(
            question: "Quel moyen de transport as-tu utilisé pour partir en vacances ?",
            guesses: [
                "La voiture",
                "Le train",
                "L'avion",
                "Le bateau"
            ],
            rightAnswerIndex: [2,3],
            IsAnswerCorrect: false
        ),
        Question(
            question: "Quel souvenir rapportes-tu généralement de tes voyages ?",
            guesses: [
                "Des photos",
                "Des cartes postales",
                "Des souvenirs",
                "Rien en particulier"
            ],
            rightAnswerIndex: [1],
            IsAnswerCorrect: false
        )
    ],
    isCompleted: false
)
