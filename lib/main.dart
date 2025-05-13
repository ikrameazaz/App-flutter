import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MedscanApp());
}

class MedscanApp extends StatelessWidget {
  const MedscanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedScan',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        secondaryHeaderColor: Colors.tealAccent,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MedScan'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Colors.teal),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'MedScan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Détection de maladies dermatologiques',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Accueil'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Historique'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HistoryPage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('À propos'),
              onTap: () {
                Navigator.pop(context);
                // Afficher une boîte de dialogue d'information
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('À propos de MedScan'),
                      content: const Text(
                          'MedScan est une application utilisant la vision par ordinateur pour détecter les maladies dermatologiques. Version 1.0.0'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Fermer'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.health_and_safety,
                size: 100,
                color: Colors.teal,
              ),
              const SizedBox(height: 20),
              const Text(
                'Bienvenue sur MedScan',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Analysez votre peau à l\'aide de l\'intelligence artificielle',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CameraScreen()),
                  );
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text('Scanner une lésion cutanée'),
                style: ElevatedButton.styleFrom(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HistoryPage()),
                  );
                },
                icon: const Icon(Icons.history),
                label: const Text('Voir historique des analyses'),
                style: OutlinedButton.styleFrom(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  foregroundColor: Colors.teal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  Future<void> _takePicture() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _imageFile = photo;
    });
    if (_imageFile != null) {
      // Simuler un délai de traitement
      await Future.delayed(const Duration(seconds: 2));
      // Naviguer vers l'écran de résultats
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(imageFile: _imageFile!),
          ),
        );
      }
    }
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image;
    });
    if (_imageFile != null) {
      // Simuler un délai de traitement
      await Future.delayed(const Duration(seconds: 2));
      // Naviguer vers l'écran de résultats
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(imageFile: _imageFile!),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capture d\'image'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.camera_alt,
                size: 80,
                color: Colors.teal,
              ),
              const SizedBox(height: 20),
              const Text(
                'Prenez une photo claire de la zone cutanée concernée',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: _takePicture,
                    icon: const Icon(Icons.camera),
                    label: const Text('Prendre une photo'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 12),
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 20),
                  OutlinedButton.icon(
                    onPressed: _pickImage,
                    icon: const Icon(Icons.photo_library),
                    label: const Text('Importer une image'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 12),
                      foregroundColor: Colors.teal,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Conseils pour une meilleure analyse:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '• Assurez-vous d\'avoir un bon éclairage\n'
                          '• Gardez l\'appareil stable\n'
                          '• Prenez la photo à une distance de 10-15 cm\n'
                          '• Évitez les zones floues ou mal cadrées',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final XFile imageFile;

  const ResultScreen({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    // Résultats simulés
    final results = [
      {'maladie': 'Eczéma', 'probabilité': 0.82},
      {'maladie': 'Psoriasis', 'probabilité': 0.11},
      {'maladie': 'Dermatite', 'probabilité': 0.07},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Résultats de l\'analyse'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image analysée
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.image,
                      size: 80,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Résultat principal
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Diagnostic principal',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      results[0]['maladie'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Confiance: ${((results[0]['probabilité'] as double) * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Autres possibilités
              const Text(
                'Autres possibilités:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: results.length - 1,
                itemBuilder: (context, index) {
                  final result = results[index + 1];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          result['maladie'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${((result['probabilité'] as double) * 100).toStringAsFixed(0)}%',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              // Informations sur la maladie
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'À propos de l\'eczéma:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'L\'eczéma, également connu sous le nom de dermatite atopique, est une affection cutanée chronique caractérisée par des démangeaisons, une rougeur, un gonflement et des fissures de la peau.',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Recommandations:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      '• Consultez un dermatologue pour confirmation\n'
                          '• Utilisez des crèmes hydratantes sans parfum\n'
                          '• Évitez les irritants comme les savons agressifs\n'
                          '• Prenez des douches tièdes plutôt que chaudes',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Boutons d'action
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Enregistrer dans l'historique (fonctionnalité à implémenter)
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Résultat enregistré dans l\'historique'),
                          backgroundColor: Colors.teal,
                        ),
                      );
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('Enregistrer'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      // Simuler le partage avec un professionnel de santé
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Partager avec un médecin'),
                            content: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Email du médecin',
                                    hintText: 'docteur@exemple.com',
                                  ),
                                ),
                                SizedBox(height: 16),
                                TextField(
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    labelText: 'Message (optionnel)',
                                    hintText:
                                    'Ajoutez des informations supplémentaires...',
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Annuler'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Rapport partagé avec le médecin'),
                                      backgroundColor: Colors.teal,
                                    ),
                                  );
                                },
                                child: const Text('Envoyer'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.share),
                    label: const Text('Partager'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.teal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Valeurs par défaut pour simulation
  String nom = 'Ikrame Azaz';
  String email = 'Ikrame.azaz@exemple.com';
  int age = 21;
  String sexe = 'Femme';
  List<String> antecedents = ['Eczéma', 'Allergie au pollen'];
  // Contrôleurs pour les champs de texte
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nomController.text = nom;
    _emailController.text = email;
    _ageController.text = age.toString();
  }

  @override
  void dispose() {
    _nomController.dispose();
    _emailController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _editProfile() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Modifier le profil'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nomController,
                  decoration: const InputDecoration(
                    labelText: 'Nom complet',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _ageController,
                  decoration: const InputDecoration(
                    labelText: 'Âge',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: sexe,
                  decoration: const InputDecoration(
                    labelText: 'Sexe',
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'Homme',
                      child: Text('Homme'),
                    ),
                    DropdownMenuItem(
                      value: 'Femme',
                      child: Text('Femme'),
                    ),
                    DropdownMenuItem(
                      value: 'Autre',
                      child: Text('Autre'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      sexe = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  nom = _nomController.text;
                  email = _emailController.text;
                  age = int.tryParse(_ageController.text) ?? age;
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Profil mis à jour avec succès'),
                    backgroundColor: Colors.teal,
                  ),
                );
              },
              child: const Text('Enregistrer'),
            ),
          ],
        );
      },
    );
  }

  void _addMedicalHistory() {
    final TextEditingController _antecedentController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ajouter un antécédent médical'),
          content: TextField(
            controller: _antecedentController,
            decoration: const InputDecoration(
              labelText: 'Antécédent',
              hintText: 'Ex: Allergie, maladie chronique, etc.',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (_antecedentController.text.isNotEmpty) {
                    antecedents.add(_antecedentController.text);
                  }
                });
                Navigator.of(context).pop();
              },
              child: const Text('Ajouter'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil utilisateur'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: _editProfile,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Photo de profil
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.teal,
                      child: Icon(Icons.person, size: 70, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      nom,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      email,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Informations personnelles
              const Text(
                'Informations personnelles',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildInfoRow('Âge', '$age ans'),
                      const Divider(),
                      _buildInfoRow('Sexe', sexe),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Antécédents médicaux
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Antécédents médicaux',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle),
                    color: Colors.teal,
                    onPressed: _addMedicalHistory,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: antecedents.isEmpty
                      ? const Center(
                    child: Text(
                      'Aucun antécédent médical enregistré',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  )
                      : ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: antecedents.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(antecedents[index]),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            color: Colors.red,
                            iconSize: 20,
                            onPressed: () {
                              setState(() {
                                antecedents.removeAt(index);
                              });
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Paramètres
              const Text(
                'Paramètres',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.notifications),
                        title: const Text('Notifications'),
                        trailing: Switch(
                          value: true,
                          activeColor: Colors.teal,
                          onChanged: (value) {
                            // Implémenter la gestion des notifications
                          },
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.lock),
                        title: const Text('Confidentialité'),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          // Navigation vers les paramètres de confidentialité
                        },
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.help),
                        title: const Text('Aide et support'),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          // Navigation vers l'aide
                        },
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.logout, color: Colors.red),
                        title: const Text('Déconnexion',
                            style: TextStyle(color: Colors.red)),
                        onTap: () {
                          // Logique de déconnexion
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Liste simulée d'analyses passées
    final analyses = [
      {
        'date': '10/05/2025',
        'diagnostic': 'Eczéma',
        'confiance': 0.82,
        'notes': 'Zone du coude gauche'
      },
      {
        'date': '28/04/2025',
        'diagnostic': 'Psoriasis',
        'confiance': 0.75,
        'notes': 'Zone du genou droit'
      },
      {
        'date': '15/04/2025',
        'diagnostic': 'Dermatite',
        'confiance': 0.68,
        'notes': 'Avant-bras droit'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historique des analyses'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: analyses.isEmpty
          ? const Center(
        child: Text(
          'Aucune analyse dans l\'historique',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: analyses.length,
        itemBuilder: (context, index) {
          final analyse = analyses[index];
          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            elevation: 2,
            child: InkWell(
              onTap: () {
                // Navigation vers le détail de l'analyse
                _showAnalysisDetails(context, analyse);
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    // Image (placeholder)
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.image,
                        color: Colors.grey,
                        size: 40,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Informations
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                analyse['diagnostic'] as String,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.teal.shade100,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  '${((analyse['confiance'] as double) * 100).toStringAsFixed(0)}%',
                                  style: TextStyle(
                                    color: Colors.teal[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Date: ${analyse['date']}',
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            analyse['notes'] as String,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CameraScreen()),
          );
        },
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }

  void _showAnalysisDetails(BuildContext context, Map<String, dynamic> analyse) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (_, controller) {
          return SingleChildScrollView(
            controller: controller,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 60,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        analyse['diagnostic'] as String,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.teal.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${((analyse['confiance'] as double) * 100).toStringAsFixed(0)}%',
                          style: TextStyle(
                            color: Colors.teal[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Date: ${analyse['date']}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Image (placeholder)
                  Center(
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.image,
                        color: Colors.grey,
                        size: 60,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Notes
                  const Text(
                    'Notes:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    analyse['notes'] as String,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Évolution
                  const Text(
                    'Évolution:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      maxLines: 3,
                      decoration: const InputDecoration(
                        hintText: 'Ajoutez des notes sur l\'évolution...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Boutons d'action
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton.icon(
                        onPressed: () {
                          // Partager les résultats
                        },
                        icon: const Icon(Icons.share),
                        label: const Text('Partager'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.teal,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Nouvelle analyse de la même zone
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CameraScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.camera_alt),
                        label: const Text('Nouvelle analyse'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
