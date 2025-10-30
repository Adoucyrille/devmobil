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
            PartieRubrique()
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
               children: const[
                Icon( Icons.phone,  color: Colors.red,),
                SizedBox(height: 5,),
                Text('TELEPHONE', style: TextStyle(color: Colors.red),)
               ], 
            ),
          ),

          Container(
            child: Column(
               children: const[
                Icon( Icons.email,  color: Colors.red,),
                SizedBox(height: 5,),
                Text('E-MAIL', style: TextStyle(color: Colors.red),)
               ], 
            ),
          ),
          Container(
            child: Column(
               children: const[
                Icon( Icons.share, color: Colors.red,),
                SizedBox(height: 5,),
                Text('PARTAGE', style: TextStyle(color: Colors.red),)
               ], 
            ),
          )
        ],
      ),
    );
  }
}
class PartieRubrique extends StatelessWidget{
  const PartieRubrique({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: const EdgeInsets.all(20),
       child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(

            child: 
             ClipRRect(
            borderRadius: BorderRadius.circular(12), 
            child: Image.asset(
              'assets/images/etr.jpg', // image à partir d’assets
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            )
          ),

          ),
          Container(
            
            child: 
             ClipRRect(
            borderRadius: BorderRadius.circular(12), 
            child: Image.asset(
              'assets/images/jutr.jpg', // image à partir d’assets
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            )
          ),

          ),
          Container(
            
            child: 
             ClipRRect(
            borderRadius: BorderRadius.circular(12), 
            child: Image.asset(
              'assets/images/download.jpeg', // image à partir d’assets
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            )
          ),

          ),
           Container(
            
            child: 
             ClipRRect(
            borderRadius: BorderRadius.circular(12), 
            child: Image.asset(
              'assets/images/do.jpeg', // image à partir d’assets
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            )
          ),

          )
        

        ],
       )
    );
  }

}
 