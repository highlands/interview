# Product Management Tool (Rails/JS)

Your task is to create a simple product management tool that lets you create products and search products in a listing page. You are required to use Ruby on Rails (>=5) and React/Vue/Ember for development.

## Requirements

Your app will implement 3 models.
* `Product` which contains the following attributes/validations:
  * `name` (string (0-1024 chars), unique)
  * `upc` (string (10,12 or 13 chars), unique, only numeric characters (0-9) allowed)
  * `available_on` (datetime, must be in the future)
* `Property` which contains the following attributes/validations:
  * `name` (string (0-255 chars), unique)
* `ProductProperty` which contains the following attributes/validations:
  * `value` (string (0-255))

`Property` will represent additional fields that can be associated with a product. Ex: brand, description, color etc.
`ProductProperty` will contain the values associated with a `Property` object and a `Product` object. Ex: "Chanel", "Red" etc. In other words, a `ProductProperty` object should contain references to a `Product` object and a `Property` object.

Your app will provide 2 pages:

* The Product Create page. This should contain a form with the required Product fields. The form should have a button that lets a user add more properties (name and value pairs) to the product. In the end there should be a save button which lets the user know if validations passed and a record was saved or not. Ex:

![Product Form](https://i.imgur.com/xShO769.png)

* The Listing page. This page lists the products created (in no particular order) and their details (including property name/value pairs). The Listing page also should contain a search field which dynamically searches product names and updates the listing page with the filtered results using React/Vue/Ember. Ex:

![Product Listing](https://i.imgur.com/2moVl0h.png)

## Guidelines

* **Your app must be developed using Ruby on Rails (>= 5.0).**
* You may use a database of your choice.
* The search functionality on the listing page **must be** implemented using React/Vue/Ember.
* The Product Create page can be developed using rails templating engine or React/Vue/Ember. **It's completely up to you to choose.** There is no penalty for not using React/Vue/Ember for this development section.
* The forms **do not** need to be styled as shown in the example images. You may leave the pages unstyled using only simple html tags if you wish to.
* There is no need to implement any sort of authentication on the app.
* You may use any gem or library in your app to complete your project. Open-source and stackoverflow is your friend.
* Your solution app **must be uploaded to github.com** and **should include a README file** containing instructions on setting up the database and running the app.
