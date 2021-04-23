# Solution fonctionnelle et technique d’un système de gestion de pizzerias

- **Date :** 1/05/2021
- **Client :** OC Pizza
- **Prestataire :** IT Consulting & Development

## Personas

Pour proposer la solution adaptée aux acteurs du système informatique de gestion des pizzerias d’OC Pizza qui sera mis en place et pour répondre au mieux aux besoin de ces cibles, voici quatre personas personifiant ces acteurs.

### Lia la cliente

![Lia la cliente](./img/persona_lia_w200.jpg)

- **Identité :**
  - Lia Clément,
  - 22 ans,
  - Étudiante en biochimie,
  - Célibataire,
  - Paris 20.
- **Biographie :** Passionnée par les jeux vidéos en ligne, elle commande fréquemment des pizzas chez OC Pizza parce qu’elle n’a que très peu de temps à consacrer à ses besoins vitaux (boire, manger, dormir).
- **Matériel informatique :** Un PC portable Alienware, un iPhone 12 Pro Max.
- **Aisance numérique :** \*\*\*\*\*
- **Citation :** _“Je n’ai pas de temps à perdre”_

### Youssef le gérant

![Youssef le gérant](./img/persona_youssef_w200.jpg)

- **Identité :**
  - Youssef Benkacem,
  - 32 ans,
  - Gérant de l’OC Pizza de Paris 19,
  - Marié, un enfant,
  - Montreuil.
- **Biographie :** Alors qu’ils dévelopaient leur franchise, Franck et Lola ont fait appel à Karim il y a un an et demi quand ils n’ont plus eu le temps de s’occuper de leur pizzeria du nord-est de Paris. Il a su très rapidement reprendre la gestion de ce point de vente dans lequel travaillent deux pizzaïolos et trois livreurs.
- **Matériel informatique :** Un Galaxy S20 et un PC portable Dell.
- **Aisance numérique :** \*\*\*--
- **Citation :** _“J’ai toujours un œil sur les performances de mon point de vente”_

### Thomas le livreur

![Thomas le livreur](./img/persona_thomas_w200.jpg)

- **Identité :**
  - Thomas Vogiel,
  - 24 ans,
  - Livreur de pizza,
  - En couple,
  - Paris 18.
- **Biographie :** Thomas a rejoint l’équipe de l’OC Pizza de l’avenue de Stalingrad il y a six mois. Il s’y sent bien et ne s’ennuie jamais : il y a toujours quelque chose à faire à OC Pizza !
- **Matériel informatique :** Un Galaxy S8 et une Xbox One 500 Go.
- **Aisance numérique :** \*\*---
- **Citation :** _“Je vis à 49.9 à l’heure”_

### Émelyne la pizzaïola

![Émelyne la pizzaïola](./img/persona_emelyne_w200.jpg)

- **Identité :**
  - Émelyne Polia,
  - 35 ans,
  - Pizzaïola à OC Pizza,
  - Mariée, deux enfants,
  - Saint-Mandé.
- **Biographie :** Après des études d’arts plastiques et avoir occupé plusieurs postes dans la vente de prêt-à-porter dans le quartier du Sentier à Paris, elle est embauchée par Franck et Lola à l’ouverture du premier point de vente d’OC Pizza il y a trois ans dans le 19e arrondissement. Elle a trouvé rapidement sa place dans les cuisine de la pizzeria et elle est essentielle à son bon fonctionnement.
- **Matériel informatique :** Un smartphone Android vieux de plusieurs années qui ne lui sert qu’à téléphoner.
- **Aisance numérique :** \*----
- **Citation :** _“Toujours donner le meilleur de moi-même”_

## Carte d’impact

OC Pizza est en plein essor et veut souhaite se doter d’un système de gestion de ses commandes efficace et réactif. Pour réaliser cet objectif, les impacts sur les acteurs du nouveau systèmes devraient être ceux-ci :

![Carte d’impact](./img/figure_impact-mapping.svg)

## Solution technique

Nous proposons de limiter le back-end à une simple API Rest JSON ou GraphQL :

1. pour minimiser les temps de réponse du serveur,
1. tout en abaissant aussi les frais d’hébergement de ce serveur
1. et en réduisant également le temps de développement du _backend_.

Le travail qu’aurait effectué le _backend_ avec une _stack_ conventionnelle comme la LAMP _stack_, c’est-à-dire la génération dynamique de contenus HTML, sera effectuée côté client.

La _stack_ que nous proposons (appelée _JAMStack_) permettra en plus de ces avantages d’utiliser tel quel le _backend_ pour des applications iOS et Android, pour _smartphones_ et tablettes.

En effet, la carte d’impact ci-dessus révèle que le choix des applications mobile et tactile devrait être fait rapidement si le groupe OC Pizza poursuivait sa croissance. IT Consulting & Development pourrait d’ailleurs accompagner OC Pizza dans le développement de telles application en parallèle de son nouveau site internet si OC Pizza le souhaite.
