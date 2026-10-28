# Fiche de cadrage : Questions sur le règlement intérieur

> Remplir chaque rubrique en une à trois phrases. Les rubriques marquées (obligatoire) sont vérifiées par `pytest`.

## Besoin en une phrase (obligatoire)

Permettre aux élèves et aux parents de poser des questions en langage naturel sur le règlement intérieur de l'école et recevoir une réponse précise extraite du document officiel.

## Utilisateur final (obligatoire)

Les élèves, leurs parents et les enseignants qui souhaitent consulter rapidement une règle spécifique sans parcourir l'intégralité du document PDF du règlement intérieur.

## Approche retenue (obligatoire)

Cocher une seule case :

- [ ] Règles métier
- [ ] Machine learning
- [x] RAG
- [ ] Modèle génératif seul

## Justification (obligatoire, citer au moins deux critères de la grille : (a) données étiquetées, (b) vérifiabilité, (c) coût par requête, (d) conséquence d'une erreur)

(b) La réponse doit être directement vérifiable dans le document officiel du règlement : le RAG ancre chaque réponse dans un passage précis, ce qui permet à l'utilisateur de consulter la source. (a) Aucune donnée étiquetée question-réponse n'est disponible, ce qui écarte le machine learning supervisé ; le RAG n'en nécessite pas car il indexe directement le document existant.

## Données nécessaires et leur origine (obligatoire)

Le document PDF du règlement intérieur de l'école, converti en texte et découpé en passages indexables ; mis à jour à chaque révision annuelle du règlement par l'administration.

## Métrique de succès et seuil d'acceptation (obligatoire)

Précision des réponses évaluée par un panel d'enseignants : au moins 90 % des réponses doivent citer un passage exact du règlement, avec un score RAGAS de fidélité ≥ 0,85.

## Conséquence d'une erreur et validation humaine prévue (obligatoire)

Une réponse incorrecte sur une règle de discipline peut créer un conflit ; chaque réponse affiche le passage source pour que l'utilisateur vérifie lui-même, et le conseiller principal d'éducation reste l'arbitre final.

## Risques éthiques ou de confidentialité (obligatoire)

Le règlement intérieur est un document public : le risque de confidentialité est faible. Il faut cependant éviter que le modèle génère des interprétations non présentes dans le texte officiel, d'où l'obligation de citer la source à chaque réponse.

## Approche écartée et pourquoi (facultatif)

Modèle génératif seul : sans ancrage dans le document, le modèle peut inventer des règles inexistantes (hallucination), ce qui est inacceptable dans un contexte réglementaire scolaire.
