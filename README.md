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

* Controller creation
  * `rails g controller home show`
  * `rails g controller team show`
  * `rails g controller contact show`
  * `rails g controller welcome show`
  * `rails g controller gossip show`
  * `rails g controller user show`

* Database creation
  * `rails generate model User first_name:string last_name:string describtion:text age:integer`
  * `rails generate model City name:string zip_code:string`
  * `rails generate model Gossip title:string content:text`
  * `rails generate model Tag title:string`
  * `rails generate model Comment content:text`
  * `rails generate model Like`
  * `rails generate model PrivateMessage content:text`

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
  * diagramme ERD : _db:/diagram_erd.vpd.pdf_
  * `bundle i`              => installer les gem
  * `rails db:create`       => créer la BDD
  * `rails db:migrate`      => exécuter la migratio
  * `rails db:seed`         => remplir les BDD
  * `rails routes`          => voir les routes
  * `rails server`          => lancer le serveur
  * `http://localhost:3000/`=> url racine

* Tests

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
