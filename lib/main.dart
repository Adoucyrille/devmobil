import 'package:flutter/material.dart';

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
          MaterialPageRoute(builder: (context) => const PageSecondaire()),
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
class PageSecondaire extends StatefulWidget {
  const PageSecondaire({super.key});

  @override
  _PageSecondaireState createState() => _PageSecondaireState();
}

class _PageSecondaireState extends State<PageSecondaire> {
  // Contrôleurs pour les champs de texte
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _domicileController = TextEditingController();

  // Méthode pour ajouter un rédacteur (pour l'instant juste un print)
  void _ajouterRedacteur() {
    final String nom = _nomController.text.trim();
    final String prenom = _prenomController.text.trim();
    final String email = _emailController.text.trim();
    final String domicile = _domicileController.text.trim();


    if (nom.isEmpty || prenom.isEmpty || email.isEmpty ||domicile.isEmpty ) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Veuillez remplir tous les champs")),
      );
      return;
    }

    // Pour l'instant on affiche juste les valeurs dans la console
    print("Rédacteur ajouté : $nom $prenom, $email");

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Rédacteur $nom $prenom ajouté !")),
    );

    // Réinitialiser les champs
    _nomController.clear();
    _prenomController.clear();
    _emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter un rédacteur"),
        backgroundColor: Colors.red,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _nomController,
              decoration: const InputDecoration(labelText: 'Nom'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _prenomController,
              decoration: const InputDecoration(labelText: 'Prénom'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _prenomController,
              decoration: const InputDecoration(labelText: 'Domicile'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _ajouterRedacteur,
              icon: const Icon(Icons.add),
              label: const Text("Ajouter le rédacteur"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



