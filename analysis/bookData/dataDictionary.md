# Data Dictionaries

## Data Dictionary for bookData.csv and authors.csv
Some of the variables were created by the LibraryThing application and values either came from Amazon.com or the Library of Congress. Variables filled by the study authors are noted.

- cataloger: Study author who categorized the book: A=Andrew, H=Hanna
- bookid: ID given to book by the LibraryThing application
- count: A variable filled with '1' to make counting easier. Values from study authors.
- title: Title of the book
- author: Author of the book in the format "last name, first name"
- combinedName: Author name in the format "first name last name". Values from study authors.
- authorOfColor: 1 indicates a BIPOC author identified as such through web searches and comparisons with other lists. This is not authoritative and the accuracy has not been confirmed with authors themselves. Values from study authors.
- nonPersonAuthor: 1 indicates the author of the book is not a person. Values from study authors.
- sex: Sex of author as determined by Wikipedia, author interviews, and author websites. Cell contains all values when multiple authors are present (See authors.csv for separated list)
- authorBirthYear: Birth year for author as determined by Wikipedia, author interviews, and author websites. Cell contains all values when multiple authors are present (See authors.csv for separated list)
- yrpub: Year published
- neighborhood: neighborhood the book was in when catologed at an LFL. Values from study authors.
- collection: Specific LFL the book was found in. Values from study authors.
- age: The reader age the book is marketed to. Values from study authors.
- type: Fiction or Nonfiction. Values from study authors.
- category1: Category using schema designed by study authors. Values from study authors.
- category1Code: An abbreiation for each category for use when making charts. Values from study authors.
- category2: Almost identical to category1 except it indicates religious children's books. Values from study authors.
- publication: Publisher, year, and number of pages
- media: Hardcover, paperback, CD or sound recording, eBook, board book, paper book, magazine, CD audiobook
- summary: Title, author and year published
- deweywording: Dewey classification
- subjects: Subject classification
- deweydec: Dewey Decimal number
- languages: Language of the book
- originalLang: the books original languages
- lcclassification: Library of Congress code
- isbn: ISBN

## Data Dictionary for lfl-stats.csv
- collection: Neighborhood and LFL assigned number
- width: Width of LFL interior in inches
- length: Length or depth of LFL interior in inches
- height: Height of LFL interior in inches. If there was a peaked roof, the measurement is to the midway point of the sloped roof.
- volMeters: Calculated volume of LFL in cubic meters
- adjPrice: Inflation adjusted last selling house price of the house stewarding the LFL. Data from zillow.com
- specific: Steward reports selecting specific genres or books to put in LFL
- current: Steward reports selecting current books for LFL
- variety: Steward reports selecting a variety of genres for LFL
- kids: Steward reports selecting childrens books for the LFL
- religion: Steward reports de-selecting religious books
- porn: Steward reports de-selecting or would de-select porographic/sexually explicit material.

## Data Dictionary for cat-codes.csv
- cat: Category/genre name
- code: Abbreviation for category/genre
