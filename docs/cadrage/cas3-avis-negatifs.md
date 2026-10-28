# Fiche de cadrage : Priorisation des avis négatifs

> Remplir chaque rubrique en une à trois phrases. Les rubriques marquées (obligatoire) sont vérifiées par `pytest`.

## Besoin en une phrase (obligatoire)

Classer automatiquement les avis clients d'un site e-commerce afin de remonter en priorité les avis négatifs vers l'équipe service client pour traitement rapide.

## Utilisateur final (obligatoire)

Les agents du service client qui traitent une file d'avis déjà priorisée, et les responsables qualité qui suivent l'évolution du sentiment client au fil du temps.

## Approche retenue (obligatoire)

Cocher une seule case :

- [ ] Règles métier
- [x] Machine learning
- [ ] RAG
- [ ] Modèle génératif seul

## Justification (obligatoire, citer au moins deux critères de la grille : (a) données étiquetées, (b) vérifiabilité, (c) coût par requête, (d) conséquence d'une erreur)

(a) Le site dispose de milliers d'avis historiques déjà étiquetés avec leur note étoiles, qui servent de supervision directe pour entraîner un classifieur de sentiment. (c) Le volume d'avis est très élevé (plusieurs milliers par jour) : un classifieur léger comme une régression logistique sur TF-IDF coûte quelques microsecondes par avis, là où un LLM serait prohibitif à cette échelle.

## Données nécessaires et leur origine (obligatoire)

Les avis textuels clients et leurs notes (1 à 5 étoiles) exportés depuis la base de données du site e-commerce ; les notes servent d'étiquettes proxy (1-2 étoiles = négatif, 4-5 = positif) pour l'entraînement.

## Métrique de succès et seuil d'acceptation (obligatoire)

F1 macro sur un jeu de test tenu à l'écart, avec un seuil d'acceptation à 0,85 ; le rappel sur la classe négative doit atteindre au moins 0,90 pour s'assurer qu'aucun avis insatisfait majeur n'est manqué.

## Conséquence d'une erreur et validation humaine prévue (obligatoire)

Un avis négatif classé positif retarde la réponse du service client et dégrade la satisfaction ; un agent révise les avis en bas de liste chaque semaine pour détecter les erreurs systématiques et alimenter un jeu de réentraînement.

## Risques éthiques ou de confidentialité (obligatoire)

Les avis peuvent contenir des informations personnelles (prénom, adresse) : anonymisation avant stockage d'entraînement. Il faut aussi veiller à ce que le modèle ne développe pas de biais envers certains profils de rédaction (langue, niveau de langue).

## Approche écartée et pourquoi (facultatif)

Règles métier par mots-clés : une liste de mots négatifs atteint environ 65 % de précision car les avis ironiques ou nuancés sont mal classés ; le machine learning capture mieux le contexte sémantique.
