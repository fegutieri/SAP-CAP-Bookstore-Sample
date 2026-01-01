const { Books } = require('#cds-models/BookService')
const { Genre } = require('#cds-models/tutorial/db')
const cds = require('@sap/cds')

module.exports = class BookService extends cds.ApplicationService { init() {

  this.before ('READ', Books, async (req) => {
    console.log('Before READ Books')
  })
  this.after ('READ', Books, async (books, req) => {
    for(const book of books){
      if(book.genre_code === Genre.Fantasy){
        book.price *= 0.8
      }
    }
  })

  return super.init()
}}
