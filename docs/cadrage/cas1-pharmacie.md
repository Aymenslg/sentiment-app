# Fiche de cadrage : Ordonnances incomplètes en pharmacie

> Remplir chaque rubrique en une à trois phrases. Les rubriques marquées (obligatoire) sont vérifiées par `pytest`.

## Besoin en une phrase (obligatoire)

Détecter automatiquement les ordonnances incomplètes présentées en pharmacie afin d'alerter le pharmacien avant toute délivrance de médicament.

## Utilisateur final (obligatoire)

Le pharmacien ou le préparateur en pharmacie, qui reçoit une alerte immédiate lorsqu'un champ obligatoire (nom du médecin, dosage, signature) est manquant sur l'ordonnance.

## Approche retenue (obligatoire)

Cocher une seule case :

- [x] Règles métier
- [ ] Machine learning
- [ ] RAG
- [ ] Modèle génératif seul

## Justification (obligatoire, citer au moins deux critères de la grille : (a) données étiquetées, (b) vérifiabilité, (c) coût par requête, (d) conséquence d'une erreur)

(b) Les champs obligatoires d'une ordonnance sont définis par la réglementation pharmaceutique : la logique est connue, stable et entièrement vérifiable par rapport au texte de loi. (d) Une ordonnance incomplète validée à tort peut entraîner un incident médicamenteux grave ; la règle doit être appliquée sans ambiguïté, ce qui exclut un modèle probabiliste.

## Données nécessaires et leur origine (obligatoire)

La liste réglementaire des champs obligatoires (nom, prénom, date, signature du médecin, dosage, durée) issue du code de la santé publique ; optionnellement, des exemples d'ordonnances anonymisées pour tester les règles.

## Métrique de succès et seuil d'acceptation (obligatoire)

Rappel sur les ordonnances incomplètes ≥ 0,99 (aucune ordonnance défectueuse ne doit passer) et précision ≥ 0,90 pour éviter les fausses alertes qui ralentissent le pharmacien.

## Conséquence d'une erreur et validation humaine prévue (obligatoire)

Une ordonnance incomplète non détectée peut conduire à une délivrance dangereuse ; le pharmacien valide l'alerte avant de refuser ou d'accepter l'ordonnance, assurant un double contrôle humain systématique.

## Risques éthiques ou de confidentialité (obligatoire)

Les ordonnances contiennent des données de santé sensibles (nom du patient, pathologie implicite) : aucune donnée ne doit quitter le système local de la pharmacie, et les journaux d'alertes doivent être chiffrés et limités aux pharmaciens habilités.

## Approche écartée et pourquoi (facultatif)

Machine learning : aucune donnée étiquetée « ordonnance incomplète » n'est disponible en volume suffisant, et les règles réglementaires sont exhaustives, ce qui rend l'apprentissage inutile et moins fiable qu'une vérification déterministe.
