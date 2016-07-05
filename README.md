# CSV importer importer using Ruby on Rails
[Heroku live link][rails-csv-importer]<br />
Web interface that accepts CSV file uploads, stores data in a relational database, and displays the data from the database.
[rails-csv-importer]: https://rails-csv-importer.herokuapp.com
## Functions
1. Accepts a CSV file via a form. Columns in the file(headers must be included) : fname, lname, address, city, state, zip_code.
1. The ShippingsImport model parses the submitted file, and stores each row in the postgres database.
1. The app validates that each column is present.
1. After upload, the application displays all the customer addresses.
1. The customer addresses are displayed in a table format with pagination.
1. The displayed addresses can be sorted according to the displayed columns.

### Implementation
- The shippings_controller's import function handles CSV file import.
- The ShippingsImport model's methods parse and save the CSV file to the database.
- Pagination is setup using the [kaminari][kaminari] gem.
- The html form ensures that the user is only allowed to upload CSV files.
[kaminari]: https://github.com/amatsuda/kaminari
