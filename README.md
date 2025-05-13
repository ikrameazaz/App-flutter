# MedScan - Application de Détection de Maladies Dermatologiques

MedScan est une application mobile innovante qui utilise la vision par ordinateur et l'intelligence artificielle pour aider à détecter et identifier les maladies dermatologiques à partir de photos de lésions cutanées.

![MedScan Logo](assets/logo.png) *(Note: Placeholder pour un futur logo)*

## Fonctionnalités Principales

- **Analyse d'images** : Prenez une photo de votre peau ou importez une image existante pour analyse
- **Détection IA** : Algorithme d'intelligence artificielle qui identifie les maladies dermatologiques potentielles
- **Résultats détaillés** : Affichage des résultats avec pourcentage de confiance et informations sur la maladie détectée
- **Historique des analyses** : Consultez vos analyses précédentes pour suivre l'évolution de votre condition
- **Profil utilisateur** : Gérez vos informations personnelles et antécédents médicaux
- **Partage de résultats** : Partagez facilement vos résultats avec des professionnels de santé

## Captures d'écran

*(Note: Descriptions des captures d'écran principales)*

- **Écran d'accueil** : Interface principale avec options pour scanner une lésion ou consulter l'historique
- **Écran de capture** : Interface pour prendre une photo ou importer une image
- **Écran de résultats** : Affichage des résultats d'analyse avec diagnostic et niveau de confiance
- **Profil utilisateur** : Gestion des informations personnelles et antécédents médicaux
- **Historique** : Liste des analyses précédentes avec possibilité de consulter les détails

## Technologies Utilisées

- **Flutter** : Framework de développement cross-platform
- **Dart** : Langage de programmation
- **Image Picker** : Package Flutter pour la capture et sélection d'images
- **Material Design** : Principes de design pour une interface utilisateur intuitive

## Installation

1. Assurez-vous d'avoir Flutter installé sur votre machine
   ```
   flutter --version
   ```

2. Clonez ce dépôt
   ```
   git clone https://github.com/votre-username/medscan.git
   ```

3. Naviguez dans le répertoire du projet
   ```
   cd medscan
   ```

4. Installez les dépendances
   ```
   flutter pub get
   ```

5. Lancez l'application
   ```
   flutter run
   ```

## Comment Utiliser MedScan

1. **Démarrage** : Lancez l'application et accédez à l'écran d'accueil
2. **Analyse** : Appuyez sur "Scanner une lésion cutanée"
3. **Capture** : Prenez une photo de la zone concernée ou importez une image existante
4. **Résultats** : Consultez les résultats de l'analyse avec le diagnostic probable
5. **Actions** : Enregistrez les résultats ou partagez-les avec un professionnel de santé
6. **Historique** : Consultez vos analyses précédentes depuis l'écran d'historique

## Structure du Projet

```
lib/
  |- main.dart            # Point d'entrée de l'application
  |- screens/             # Écrans de l'application
  |- widgets/             # Composants réutilisables
  |- models/              # Modèles de données
  |- services/            # Services (API, stockage, etc.)
  |- utils/               # Utilitaires et helpers
```

## Avertissement Important

**Cette application est conçue comme un outil d'aide et ne remplace en aucun cas une consultation médicale professionnelle. Les résultats fournis sont des suggestions basées sur des algorithmes et doivent toujours être confirmés par un dermatologue ou un professionnel de santé qualifié.**

## Développements Futurs

- Intégration d'un modèle d'IA plus avancé pour améliorer la précision des diagnostics
- Ajout de fonctionnalités de suivi de l'évolution des lésions cutanées dans le temps
- Mise en place d'une communication directe avec des dermatologues via l'application
- Support pour plusieurs langues
- Version web pour une accessibilité accrue

## Licence

Ce projet est sous licence MIT. Voir le fichier LICENSE pour plus de détails.

## Contact

Pour toute question ou suggestion, veuillez contacter l'équipe de développement à l'adresse suivante : contact@medscan-app.com

---

*Note: MedScan est actuellement en phase de développement et certaines fonctionnalités peuvent être limitées ou simulées.*
