# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  * ruby-2.7.1

* System dependencies
  * gem `table_print`
  * gem `faker`

* Configuration

* Database creation
  * `rails generate model User first_name:string last_name:string describtion:text age:integer`
  * `rails generate model City name:string zip_code:string`
  * `rails generate model Gossip title:string content:text`
  * `rails generate model Tag title:string`
  * `rails generate model Comment content:text`
  * `rails generate model Like`
  * `rails generate model PrivateMessage content:text`

* Database initialization

* Controller creation
  * `rails g controller team index`
  * `rails g controller contact index`
  * `rails g controller welcome show`
  * `rails g controller user show`
  * `rails g controller city show`
  * `rails g controller gossips index new create show edit update destroy`
  * `rails g controller comments index new create show edit update destroy`
  * `rails g controller tags index new create show edit update destroy`
  * `rails g migration AddEmailAndPasswordToUser`
  * `rails g controller sessions index new create show edit update destroy`
  * `rails g controller likes index new create show edit update destroy`
  * `rails g migration AlterLikePolymorphic`

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
  * diagramme ERD : _db:/diagram_erd.vpd.pdf_
  * `bundle i`                => installer les gem
  * `rails db:create`         => créer la BDD
  * `rails generate migration NomDeMaMigration` => préparer une migration
  * `rails db:migrate`        => exécuter la migration
  * `rails db:rollback`       => supprimer une migration
  * `rails db:migrate:status` => voir la liste des migrations
  * `rails db:seed`           => remplir les BDD
  * `rails routes`            => voir les routes
  * `rails server`            => lancer le serveur
  * `http://localhost:3000/`  => url racine

* TESTS en console

|ACTION|COMMANDE|
|:---|:---|
|Afficher la table des rendez-vous|`tp NomDeLaTable.all`|
|Créer une ville|`City.create(city_name: "nom de la ville",zip_code: "xxxxx")`|
|Créer un utilisateur|`User.create(first_name: "prénom", last_name: "nom de famille", describtion: "texte", age: 00, city: City.find_by(name: "nom de la ville""))`|
|Créer un potin|`Gossip.create(title: "titre du potin", content: "texte", user: utilisateur_existant, tag: pas obligatoire - sinon tag_existant)`|
|Créer un commentaire|`Comment.create(content: "texte", user: utilisateur_existant, comment_type: gossip_existant ou comment_existant`|
|Créer un like|`Like.create(user: utilisateur_existant, gossip: pas obligatoire - gossip_existant, comment: pas obligatoire - comment_existant)`|
|Créer un tag|`Tag.create(title: "titre")`|
|Créer un message privé|`PrivateMessage.create(sender: utilisateur_existant, recipient: utilisateur_existant, content: "texte")`|
|créer un utilisateur nommé `anonymous`|`User.create(first_name: "anonymous", last_name: "anonymous", describtion: "grosse buse", age: 1, city_id: City.first.id)`|
|créer un user et création du hash|`my_user = User.create(password: "foobar", email: "kris@dick.org", first_name: "anonymous", last_name: "anonymous", describtion: "grosse buse", age: 1, city_id: City.first.id)`|
|vérifier si un string correspond à son mot de passe|`my_user.authenticate("foobar")`|
||`u = User.create(password: "foobar", email: "kris@dick.org", first_name: "erwan", last_name: "le corre", describtion: "rrrrrrrrrrrrrre", age: 35, city_id: City.first.id)`|
||``|

## Problèmes avec Heroku
- `bundle update`
- `git add Gemfile.lock`
- `git commit -m 'Update Gemfile.lock for Heroku'`
- `git push heroku master`

https://git.heroku.com/thpgossip.git

## Schema de la Base de Données
[![](https://mermaid.ink/img/eyJjb2RlIjoiZXJEaWFncmFtXG4gICAgICAgIGNpdGllcyB8fC0tb3sgdXNlcnM6IGJlbG9uZ3NfdG9cbiAgICAgICAgY2l0aWVze1xuICAgICAgICBpbnRlZ2VyIGlkX1BLXG4gICAgICAgIHN0cmluZyBuYW1lXG4gICAgICAgIHN0cmluZyB6aXBfY29kZVxuICAgICAgICB9XG4gICAgICAgIHVzZXJzIHx8LS1veyBnb3NzaXBzOiBiZWxvbmdzX3RvXG4gICAgICAgIHVzZXJze1xuICAgICAgICBpbnRlZ2VyIGlkX1BLXG4gICAgICAgIHN0cmluZyBmaXJzdF9uYW1lXG4gICAgICAgIHN0cmluZyBsYXN0X25hbWVcbiAgICAgICAgdGV4dCBkZXNjcmlwdGlvblxuICAgICAgICBpbnRlZ2VyIGFnZVxuICAgICAgICBpbnRlZ2VyIGNpdHlfaWRfRktcbiAgICAgICAgfVxuICAgICAgICBnb3NzaXBze1xuICAgICAgICBpbnRlZ2VyIGlkX1BLXG4gICAgICAgIHN0cmluZyB0aXRsZVxuICAgICAgICB0ZXh0IGNvbnRlbnRcbiAgICAgICAgaW50ZWdlciB1c2VyX2lkX0ZLXG4gICAgICAgIGludGVnZXIgdGFnX2lkX0ZLXG4gICAgICAgIH1cbiAgICAgICAgdXNlcnMgfHwtLW97IHByaXZhdGVfbWVzc2FnZXM6IGJlbG9uZ3NfdG9cbiAgICAgICAgcHJpdmF0ZV9tZXNzYWdlc3tcbiAgICAgICAgaW50ZWdlciBpZF9QS1xuICAgICAgICB0ZXh0IGNvbnRlbnRcbiAgICAgICAgaW50ZWdlciBzZW5kZXJfaWQtVXNlcl9GS1xuICAgICAgICBpbnRlZ2VyIHJlY2lldmVyX2lkLVVzZXJfRktcbiAgICAgICAgfVxuICAgICAgICB1c2VycyB8fC0tb3sgY29tbWVudHM6IGJlbG9uZ3NfdG9cbiAgICAgICAgY29tbWVudHN7XG4gICAgICAgIGludGVnZXIgaWRfUEtcbiAgICAgICAgdGV4dCBjb250ZW50XG4gICAgICAgIGludGVnZXIgZ29zc2lwX2lkX0ZLXG4gICAgICAgIGludGVnZXIgdXNlcl9pZF9GS1xuICAgICAgICB9XG4gICAgICAgIGdvc3NpcHMgfHwtLW97IGxpa2VzOiBiZWxvbmdzX3RvXG4gICAgICAgIGxpa2Vze1xuICAgICAgICBpbnRlZ2VyIGlkX1BLXG4gICAgICAgIGludGVnZXIgZ29zc2lwc19pZF9GS1xuICAgICAgICBpbnRlZ2VyIHVzZXJfaWRfRktcbiAgICAgICAgaW50ZWdlciBjb21tZW50X2lkX0ZLXG4gICAgICAgIH1cbiAgICAgICAgY29tbWVudHMgfHwtLW97IGxpa2VzOiBiZWxvbmdzX3RvXG4gICAgICAgIHVzZXJzIHx8LS1veyBsaWtlczogYmVsb25nc190b1xuICAgICAgICB0YWdzIHx8LS1veyBnb3NzaXBzOiBiZWxvbmdzX3RvXG4gICAgICAgIHRhZ3N7XG4gICAgICAgIGludGVnZXIgaWRfUEtcbiAgICAgICAgc3RyaW5nIHRpdGxlXG4gICAgICAgIH0iLCJtZXJtYWlkIjp7fSwidXBkYXRlRWRpdG9yIjpmYWxzZX0)](https://mermaid-js.github.io/mermaid-live-editor/#/edit/eyJjb2RlIjoiZXJEaWFncmFtXG4gICAgICAgIGNpdGllcyB8fC0tb3sgdXNlcnM6IGJlbG9uZ3NfdG9cbiAgICAgICAgY2l0aWVze1xuICAgICAgICBpbnRlZ2VyIGlkX1BLXG4gICAgICAgIHN0cmluZyBuYW1lXG4gICAgICAgIHN0cmluZyB6aXBfY29kZVxuICAgICAgICB9XG4gICAgICAgIHVzZXJzIHx8LS1veyBnb3NzaXBzOiBiZWxvbmdzX3RvXG4gICAgICAgIHVzZXJze1xuICAgICAgICBpbnRlZ2VyIGlkX1BLXG4gICAgICAgIHN0cmluZyBmaXJzdF9uYW1lXG4gICAgICAgIHN0cmluZyBsYXN0X25hbWVcbiAgICAgICAgdGV4dCBkZXNjcmlwdGlvblxuICAgICAgICBpbnRlZ2VyIGFnZVxuICAgICAgICBpbnRlZ2VyIGNpdHlfaWRfRktcbiAgICAgICAgfVxuICAgICAgICBnb3NzaXBze1xuICAgICAgICBpbnRlZ2VyIGlkX1BLXG4gICAgICAgIHN0cmluZyB0aXRsZVxuICAgICAgICB0ZXh0IGNvbnRlbnRcbiAgICAgICAgaW50ZWdlciB1c2VyX2lkX0ZLXG4gICAgICAgIGludGVnZXIgdGFnX2lkX0ZLXG4gICAgICAgIH1cbiAgICAgICAgdXNlcnMgfHwtLW97IHByaXZhdGVfbWVzc2FnZXM6IGJlbG9uZ3NfdG9cbiAgICAgICAgcHJpdmF0ZV9tZXNzYWdlc3tcbiAgICAgICAgaW50ZWdlciBpZF9QS1xuICAgICAgICB0ZXh0IGNvbnRlbnRcbiAgICAgICAgaW50ZWdlciBzZW5kZXJfaWQtVXNlcl9GS1xuICAgICAgICBpbnRlZ2VyIHJlY2lldmVyX2lkLVVzZXJfRktcbiAgICAgICAgfVxuICAgICAgICB1c2VycyB8fC0tb3sgY29tbWVudHM6IGJlbG9uZ3NfdG9cbiAgICAgICAgY29tbWVudHN7XG4gICAgICAgIGludGVnZXIgaWRfUEtcbiAgICAgICAgdGV4dCBjb250ZW50XG4gICAgICAgIGludGVnZXIgZ29zc2lwX2lkX0ZLXG4gICAgICAgIGludGVnZXIgdXNlcl9pZF9GS1xuICAgICAgICB9XG4gICAgICAgIGdvc3NpcHMgfHwtLW97IGxpa2VzOiBiZWxvbmdzX3RvXG4gICAgICAgIGxpa2Vze1xuICAgICAgICBpbnRlZ2VyIGlkX1BLXG4gICAgICAgIGludGVnZXIgZ29zc2lwc19pZF9GS1xuICAgICAgICBpbnRlZ2VyIHVzZXJfaWRfRktcbiAgICAgICAgaW50ZWdlciBjb21tZW50X2lkX0ZLXG4gICAgICAgIH1cbiAgICAgICAgY29tbWVudHMgfHwtLW97IGxpa2VzOiBiZWxvbmdzX3RvXG4gICAgICAgIHVzZXJzIHx8LS1veyBsaWtlczogYmVsb25nc190b1xuICAgICAgICB0YWdzIHx8LS1veyBnb3NzaXBzOiBiZWxvbmdzX3RvXG4gICAgICAgIHRhZ3N7XG4gICAgICAgIGludGVnZXIgaWRfUEtcbiAgICAgICAgc3RyaW5nIHRpdGxlXG4gICAgICAgIH0iLCJtZXJtYWlkIjp7fSwidXBkYXRlRWRpdG9yIjpmYWxzZX0)

## Pages
- accueil => affiche tous les potins
  - author.first_name
  - title
  - lien pour chaque page de potin
  - utiliser les _card_
- potin
  - auteur (user) + lien vers page auteur
  - title
  - content
  - lien vers la page d'accueil
- contact => adresse de contact
- équipe => toi et ton binome
- bienvenue => accueille l'utilisateur en fonction du nom passé dans l'URL

## Création d'un potin
### méthodes
- `#new`
- `#create`
### views
- `gossips/new.html.erb` => new
- `gossips.html.erb` => create (renvoie vers l'index)
### formulaire `form_tag` (new)
- `title`
- `content`
- méthode `#create` => validation
### controller `gossips`
- méthode `#create`
- si formulaire "accepté" => alerte (verte)
- si formulaire "refusé" => reste sur la page + alerte (rouge)
- créer (en console) un utilisateur nommé `anonymous`
  - y associer tous les potins créés dans la view `new`
### Commentaires
- _nombre_ de commentaires => page "index" (de "gossip")
  - pour chaque potin
- création
  - formulaire et liste => page "show" (de "gossip")
    - commentaire
    - auteur (nommé `anonymous`)
- modification => page "edit"
- destroy
### Tags
- ajouter un tag à la _création du potin_
  - `select` => affiche tous les tags
    - soit en HTML
    - soit helper `select_tag` (lié à un `form_tag`)
  - controller => met à disposition de la "view", un array de tags
- GOD MODE : ajouter plusieurs tags à un potin
  - regarder le concept des `nested forms`

### Login / logout
- écran de connexion avec "email" et "mot de passe"
  - si connection => redirection vers la page d'accueil
  - `sessions_controller` (méthodes `#new` et `#create`)
- Logout
  - sessions#destroy
- bouton qui change en fonction de l'état de l'utilisateur => "navbar"
  - si pas connecté => dropdown "S'inscrire / Se connecter"
    - bouton pour lien (`users#new`)
    - lien pour se connecter (`sessions#new`)
  - si connecté => bouton pour se déconnecter (sessions#destroy)
### Associations à l'utilisateur connecté
- créer un potin
- créer un commentaire
### Impossible de commérer sans inscription
- vérification de la connexion (avant de se lancer)
  - méthode `#new`
  - méthode `#create`
- si pas connecté => redirection vers l'écran de "login"
  - création de potins
  - affichage du potin
  - création de commentaires
### Édition et destruction des potins
- pour éditer le potin => l'utilisateur connecté est le créateur du potin
  - méthodes `gossips#edit`, `gossips#update` et `gossips#destroy` => vérifient que le "current_user" soit bien le créateur du potin
### Like that
- un utilisateur peut _liker_
  - si pas connecté => impossible de _liker_
  - possibilité de _déliker_ un potin
- _liker_ + nombre de likes d'un potin sur
  1. index des potins
  2. affichage d'un potin
  3. villes (liste des potins d'une ville)

### Mise en ligne sur Heroku
### Système de cookies

### Checkbox _Se souvenir de moi_
