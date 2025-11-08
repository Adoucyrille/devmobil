import 'package:activite345/modele/Redacteur.dart';
import 'package:flutter/material.dart';
import 'package:activite345/modele/BdADOU.dart';

void main() {
  runApp(const MonAppli());
}

class MonAppli extends StatelessWidget {
  const MonAppli({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magazine',
      debugShowCheckedModeBanner: false,
      home: const PageAccueil(),
    );
  }
}

// Page d'accueil principale
class PageAccueil extends StatelessWidget {
  const PageAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Magazine Infos'),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            // Image principale
            Image(
              image: AssetImage('assets/images/OOLGRP0.jpg'),
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            PartieTitre(),
            SizedBox(height: 10),
            PartieTexte(),
            SizedBox(height: 10),
            PartieIcone(),
            PartieRubrique(),
            // Bouton ajouté ici pour aller sur une autre page
            SizedBox(height: 20),
            BoutonNouvellePage(), 
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Tu as cliqué dessus')),
          );
        },
        backgroundColor: Colors.red,
        child: const Text(
          'Click',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

/// PartieTitre : affiche deux titres (niveau 1 et 2)
class PartieTitre extends StatelessWidget {
  const PartieTitre({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // s’étend sur toute la largeur
      padding: const EdgeInsets.all(20), // marge intérieure de 20 px
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start, // alignement au début
        children: [
          Text(
            'Bienvenue sur Magazine Infos',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Votre source d’actualités numériques',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

/// PartieTexte : paragraphe de présentation du magazine
class PartieTexte extends StatelessWidget {
  const PartieTexte({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Text(
        "Magazine Infos est un magazine numérique moderne qui vous propose les dernières nouvelles, analyses et tendances du monde numérique, de la culture, du sport et bien plus encore. Restez informé avec des articles fiables et inspirants.",
        style: TextStyle(fontSize: 16, height: 1.5),
        textAlign: TextAlign.justify,
      ),
    );
  }
}

/// PartieIcone : icônes pour actions (Téléphone, E-mail, Partage)
class PartieIcone extends StatelessWidget {
  const PartieIcone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Column(
              children: const [
                Icon(Icons.phone, color: Colors.red),
                SizedBox(height: 5),
                Text('TELEPHONE', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
          Container(
            child: Column(
              children: const [
                Icon(Icons.email, color: Colors.red),
                SizedBox(height: 5),
                Text('E-MAIL', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
          Container(
            child: Column(
              children: const [
                Icon(Icons.share, color: Colors.red),
                SizedBox(height: 5),
                Text('PARTAGE', style: TextStyle(color: Colors.red)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PartieRubrique extends StatelessWidget {
  const PartieRubrique({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/etr.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            )),
            Container(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/jutr.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            )),
            Container(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/download.jpeg',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            )),
            Container(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/do.jpeg',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            )),
          ],
        ));
  }
}

///  Bouton pour naviguer vers une autre page
class BoutonNouvellePage extends StatelessWidget {
  const BoutonNouvellePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RedacteursInterface()),
        );
      },
      child: const Text(
        'Voir les redacteurs',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// Nouvelle page secondaire : formulaire pour ajouter un rédacteur

class RedacteursInterface extends StatefulWidget {
  const RedacteursInterface({super.key});

  @override
  _RedacteursInterfaceState createState() => _RedacteursInterfaceState();
}

class _RedacteursInterfaceState extends State<RedacteursInterface> {
  // Contrôleurs pour les champs de texte
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _domicileController = TextEditingController();

  // Liste des rédacteurs enregistrés
  List<Redacteur> _redacteurs = [];

  @override
  void initState() {
    super.initState();
    _chargerRedacteurs();
  }

  // Charger tous les rédacteurs depuis la base de données
  Future<void> _chargerRedacteurs() async {
    final redacteurs = await DatabaseADOU.instance.getAllRedacteurs();
    if (!mounted) return;
    setState(() {
      _redacteurs = redacteurs;
    });
  }

  // Ajouter un rédacteur
  Future<void> _ajouterRedacteur() async {
    if (_nomController.text.isEmpty ||
        _prenomController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _domicileController.text.isEmpty) {
      _afficherMessage('Veuillez remplir tous les champs');
      return;
    }

    final nouveauRedacteur = Redacteur.sansId(
      nom: _nomController.text.trim(),
      prenom: _prenomController.text.trim(),
      email: _emailController.text.trim(),
      domicile: _domicileController.text.trim(),
    );

    await DatabaseADOU.instance.insertRedacteur(nouveauRedacteur);

    // Réinitialiser les champs
    _nomController.clear();
    _prenomController.clear();
    _emailController.clear();
    _domicileController.clear();

    // Recharger la liste
    await _chargerRedacteurs();

    _afficherMessage('Rédacteur ajouté avec succès');
  }

  // Supprimer un rédacteur
  Future<void> _supprimerRedacteur(int id) async {
    final confirmation = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirmation"),
        content: const Text("Voulez-vous vraiment supprimer ce rédacteur ?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Annuler"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Supprimer", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmation == true) {
      await DatabaseADOU.instance.deleteRedacteur(id);
      await _chargerRedacteurs();
      _afficherMessage("Rédacteur supprimé avec succès");
    }
  }

  // Modifier un rédacteur
  Future<void> _modifierRedacteur(Redacteur redacteur) async {
    final nomController = TextEditingController(text: redacteur.nom);
    final prenomController = TextEditingController(text: redacteur.prenom);
    final emailController = TextEditingController(text: redacteur.email);
    final domicileController = TextEditingController(text: redacteur.domicile);

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Modifier le rédacteur"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nomController, decoration: const InputDecoration(labelText: "Nom")),
            TextField(controller: prenomController, decoration: const InputDecoration(labelText: "Prénoms")),
            TextField(controller: emailController, decoration: const InputDecoration(labelText: "E-mail")),
            TextField(controller: domicileController, decoration: const InputDecoration(labelText: "Domicile")),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Annuler"),
          ),
          ElevatedButton(
            onPressed: () async {
              final modifie = Redacteur(
                id: redacteur.id,
                nom: nomController.text.trim(),
                prenom: prenomController.text.trim(),
                email: emailController.text.trim(),
                domicile: domicileController.text.trim(),
              );
              await DatabaseADOU.instance.updateRedacteur(modifie);
              Navigator.pop(context);
              await _chargerRedacteurs();
              _afficherMessage("Rédacteur modifié avec succès");
            },
            child: const Text("Enregistrer"),
          ),
        ],
      ),
    );
  }

  // Afficher un message
  void _afficherMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestion des rédacteurs"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Champs pour ajouter un rédacteur
            TextField(controller: _nomController, decoration: const InputDecoration(labelText: 'Nom')),
            const SizedBox(height: 10),
            TextField(controller: _prenomController, decoration: const InputDecoration(labelText: 'Prénoms')),
            const SizedBox(height: 10),
            TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'E-mail')),
            const SizedBox(height: 10),
            TextField(controller: _domicileController, decoration: const InputDecoration(labelText: 'Domicile')),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _ajouterRedacteur,
              icon: const Icon(Icons.add),
              label: const Text("Ajouter un rédacteur"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
            const SizedBox(height: 20),
            // Liste des rédacteurs
            Expanded(
              child: _redacteurs.isEmpty
                  ? const Center(child: Text("Aucun rédacteur enregistré"))
                  : ListView.builder(
                      itemCount: _redacteurs.length,
                      itemBuilder: (context, index) {
                        final redacteur = _redacteurs[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text("${redacteur.nom} ${redacteur.prenom}", style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Email : ${redacteur.email}"),
                                Text("Domicile : ${redacteur.domicile}"),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit, color: Colors.blue),
                                  onPressed: () => _modifierRedacteur(redacteur),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => _supprimerRedacteur(redacteur.id!),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}








