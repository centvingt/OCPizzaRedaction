# Spécifications fonctionnelles d’un système de gestion de pizzerias

- **Date :** 1/05/2021
- **Client :** OC Pizza
- **Prestataire :** IT Consulting & Development

## Intentions et objectifs du présent document

Ces spécifications fonctionnelles, rédigées à partir du recueil des besoins du client, sont destinées :

1. à assurer au client que le prestataire a bien compris ses besoins pour les combler au mieux,
1. à présenter les solutions fonctionnelles qui guideront les choix de développement et de mise en production du projet.

Ainsi, à la suite de la présentation de ce document, il sera demandé au client :

1. de vérifier les informations et les données qui y sont décrites,
1. et d’approuver les solutions qui y sont présentées.

Dans le cadre des méthodes Agile, ce document devra être mis à jour en fonction de l’évolution du projet, de ses nouvelles données et des nouvelles solutions qui pourraient être mises en œuvre.

Chaque mise à jour de ce document par le prestataire devra être à nouveau vérifiée et approuvée par le client.

Les versions successives de ce document seront conservées et versionnées dans ce dépôt GitHub : [Dépôt GitHub des spécifications fonctionnelles du présent projet](https://github.com/centvingt/OCPizzaRedaction).

<!--
les différents acteurs interagissant avec le futur système ;
la liste des fonctionnalités ;
le descriptif des fonctionnalités ; -> programmé
le cycle de vie des commandes. -> diagramme d'activité à faire

2-3 personas -> impact mapping -> fonctionnalités par utilisateur
diagrammes de cas d'utilisation uml, ddd;
puis descriptif détaillés (scénarios uml ou user stories agiles) en détaillant bien le chemin utilisateur (chaque étape que l’utilisateur suivra pour la fonctionnalité en question);
bien modéliser le processus de prise de commande

Analyser un besoin client

Les acteurs sont clairement définis.
Les fonctionnalités explicites et implicites sont identifiées à partir du recueil des besoins.
Le processus de commande est modélisé.
Les points ci-dessus sont retranscrits dans le dossier de spécifications fonctionnelles.
----
Lister les fonctionnalités demandées par un client

Les fonctionnalités sont listées en suivant une méthodologie.
La liste est exhaustive.
----
Rédiger les spécifications détaillées d'un projet

Les fonctionnalités sont décrites en suivant une méthodologie.
Chaque fonctionnalité est décrite étape par étape, que ce soit textuellement et/ou via des schémas/diagrammes.
 -->

## Contexte

OC Pizza est un groupe de cinq points de vente de pizzas livrées ou à emporter qui ouvrira trois nouveaux points de vente dans six mois.

Son système informatique actuel :

1. ne lui permet pas une gestion centralisée de ses pizzerias pour suivre leurs ventes et leurs stocks d’ingrédients,
1. ne permet pas à ses livreurs de mettre à jour en temps réel le statut d’une livraison effectuée.

## Objectifs du client

OC Pizza a besoin d’un nouveau système informatique :

1. plus efficace pour traiter les commandes, de leur réception à leur livraison en passant par leur préparation,
1. permettant de suivre en temps réel les commandes :
   1. passées,
   1. en préparation,
   1. en livraison.
1. permettant de suivre en temps réel le stock d’ingrédients restant pour savoir quelles pizzas peuvent encore être préparées,
1. comportant un site internet pour que les clients puissent :
   1. passer leur commandes en plus de la prise de commande par téléphone ou sur place,
   1. payer en ligne leur commande ou payer directement à la livraison,
   1. modifier ou annuler leur commande tant que celle-ci n’a pas été préparée.
1. proposer un aide-mémoire aux pizzaiolos indiquant la recettes de chaque pizza.

## Aspects pratiques

Le nouveau système de gestion doit être mis en production pour l’ouverture des trois nouvelles pizzeria du groupe le 1/11/2021.

## Acteurs du système

Les acteurs interagissant avec le système identifiés dans le recueil des besoins sont :

1. le client qui commande une pizza en ligne,
1. le responsable du point de vente qui traite une commande passée sur place ou par téléphone,
1. le livreur qui livre une commande à un client,
1. le pizzaïolo qui prépare une commande.

![Les acteurs du système](./img/figure_system-actors.svg)

## Interactions des acteurs avec le système

La lecture du recueil des besoins du client permet d’identifier :

1. des fonctionnalités explicitement demandées par le client, nommées ci-dessous les _fonctionnalités explicites_,
1. des fonctionnalités implicitement nécessaires au systèmes, ommées ci-dessous les _fonctionnalités implicites_,

### Fonctionnalités explicites

Ces fonctionnalités figurent clairemnt dans le recueil des besoins du client :

- Suivre en temps réel le statut des commandes
- Suivre en temps réel le stock d’ingrédients restant
- Savoir quelles pizzas peuvent encore être réalisées
- Passer une commande
- Payer une commande en ligne
- Payer une commande à la livraison
- Modifier une commande
- Annuler une commande
- Afficher la recette d’une pizza

![Fonctionnalités explicites](./img/figure_explicit-actions.svg)

### Fonctionnalités implicites

#### Fonctionnalités liées au status d’une commande

Suivre le statut en temps réel des commandes reçues, en préparation et en livraison implique de modifier ce status. Par ailleurs, il est nécessaire à la bonne efficacité du système d’ajouter plusieurs statuts en plus des statuts _Reçue_, _En préparation_ et _En livraison_ :

- Modifier le status d’une commande :
  - Régler le statut d’une commande à “Reçue”
  - Régler le statut d’une commande à “En préparation”
  - Régler le statut d’une commande à “Prête à être livrée”
  - Régler le statut d’une commande à “Prête à être retirée”
  - Régler le statut d’une commande à “En livraison”
  - Régler le statut d’une commande à “Livrée”
  - Régler le statut d’une commande à “Retirée”
  - Régler le statut d’une commande à “Annulée”

![Fonctionnalités liées au status d’une commande](./img/figure_implicit-actions-order-status.svg)

#### Fonctionnalité liée au suivi stock d’ingrédients

Pour suivre en temps réel le stock d’ingrédients restant, il faut que le système puisse mettre à jour ce stock :

- Mettre à jour le stock d’ingrédients restant

Cette action devra être déclenchée :

1. à la réception de chaque commande,
1. à la modification ou l’annulation d’une commande si sa préparation n’a pas commencé.

![Fonctionnalité liée au stock d’ingrédients](./img/figure_implicit-actions-update-stock.svg)

#### Fonctionnalités liées au paiement

Pour payer une commande en ligne, à la livraison ou dans le point de vente, il est nécessaire que ces trois actions généralisent l’action de payer une commande :

- Payer une commande :
  - Payer une commande en ligne
  - Payer une commande à la livraison
  - Payer une commande sur place

![Fonctionnalités liées au paiement](./img/figure_implicit-actions-payment.svg)

#### Fonctionnalités liées à la livraison

Pour choisir la livraison de la commande ou son retrait sur place, ces actions sont nécessaires :

- Choisir le mode de livraison de la commande :
  - Choisir la livraison de la commande à domicile
  - Choisir le retrait de la commande sur place

![Fonctionnalités liées à la livraison](./img/figure_implicit-actions-delivery.svg)

#### Fonctionnalités liées à l’authentification

Les acteurs devront s’authentifier pour commander une pizza, suivre les commandes, vérifier les stocks, etc. Cela nécessite donc les actions suivantes :

- Créer un compte
- S’authentifier

![Fonctionnalités liées à l’authentification](./img/figure_implicit-actions-account.svg)

### Cas d’utilisation et récits utilisateur

#### Cas d’utilisation et récits utilisateur du client

Les cas d’utilisation du système par le client sont les suivants :

![Fonctionnalités liées à l’authentification](./img/figure_use-case-diagram-customer.svg)

En analysant ce schéma, nous pouvons déterminer ces récits utilisateur :

> En tant que **client,** je veux **passer une commande** pour **obtenir cette commande**
>
> En tant que **client non authentifé,** je veux **m’authentifier** pour **passer une commande**
>
> En tant que **client non authentifé,** je veux **m’authentifier** pour **modifier une commande**
>
> En tant que **client non authentifé,** je veux **m’authentifier** pour **annuler une commande**
>
> En tant que **client sans compte,** je veux **créer un compte** pour **m’authentifier**
>
> En tant que **client authentifié passant une commande avec une livraison à domicile,** je veux **choisir un paiement à la livraison** pour **passer une commande**
>
> En tant que **client authentifié,** je veux **choisir un paiement en ligne** pour **passer une commande**
>
> En tant que **client authentifié passant une commande avec un retrait sur place,** je veux **choisir un paiement sur place** pour **passer une commande**
>
> En tant que **client authentifié,** je veux **choisir une livraison à domicile** pour **passer une commande**
>
> En tant que **client authentifié,** je veux **choisir un retrait sur place** pour **passer une commande**
>
> En tant que **client**, je veux **savoir quelles pizzas peuvent encore être réalisées** pour **passer une commande**

#### Cas d’utilisation et récits utilisateur du responsable de point de vente

#### Cas d’utilisation et récits utilisateur du livreur

#### Cas d’utilisation et récits utilisateur du pizzaïolo

## Processus de commande

La logique procédurale du processus de commande est tout d’abord décrite ici à partir d’un scénario nominal dans lequel :

1. le client crée un compte au lieu de s’authentifier,
1. choist de se faire livrer sa commande à domicile au lieu de la retirer dans le point de vente,
1. choist de payer sa commande en ligne au lieu de la payer à la livraison,
1. ne modifie pas sa commande ni ne l’annule.

Des scénarios alternatifs seront ajoutés à ce scénario nominal pour traiter tous les cas de figure d’une commande.

### Scénario nominal

1. Le système affiche les pizza réalisables,
1. Le client ajoute une ou plusieurs pizzas réalisables à la commande,
1. Le client valide la commande
1. Le système propose au client de s’authentifier ou de créer un compte
1. Le client crée un compte
1. Le système invite le client à choisir un mode de livraison
1. Le client choisit de se faire livrer sa commande à son domicile
1. Le système invite le client à choisir un mode de paiement
1. Le client choisit de payer en ligne
1. Le client effectue son paiement en ligne
1. Le système crée une nouvelle commande avec le statut “Reçue”
1. Le pizzaïolo passe la commande au statut “En préparation”
1. Le pizzaïolo passe la commande au statut “Prête à être livrée”
1. Le livreur passe la commande au statut “En livraison”
1. Le livreur livre la pizza au domicile du client
1. La commande passe au statut “Livrée”

### Scénarios alternatifs

#### Le client s’authentifie au lieu de créer un compte

#### Le client choisit le retrait de sa commande sur place

#### Le client choisit le retrait de sa commande sur place et de payer sur place

#### Le client choisit de payer à la livraison

#### Le client choisit de modifier sa commande

#### Le client choisit d’annuler sa commande

### Diagramme d’activité

<!-- ![Diagramme d’activité](./img/figure_activity-diagram.svg) -->
