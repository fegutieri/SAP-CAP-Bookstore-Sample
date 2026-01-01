const { Books } = require('#cds-models/BookService')
const { Genre } = require('#cds-models/tutorial/db')
const cds = require('@sap/cds')

module.exports = class BookService extends cds.ApplicationService {
  init() {


    this.on('addStock', Books, async (req) => {
      const bookId = req.params[0].ID
      await UPDATE(Books)
        .set({ stock: { '+=': 1 } })
        .where({ ID: bookId })

    })

    this.on('changePublishDate', Books, async (req) => {
      const bookId = req.params[0].ID
      const newDate = req.data.newDate
      await UPDATE(Books)
        .set({ publishedAt: newDate })
        .where({ ID: bookId })

    })

    this.on('changeStatus', Books, async (req) => {
      const bookId = req.params[0].ID
      const newStatus = req.data.newStatus
      await UPDATE(Books)
        .set({ status_code: newStatus })
        .where({ ID: bookId })

    })

    this.before('READ', Books, async (req) => {
      console.log('Before READ Books')
    })
    this.after('READ', Books, async (books, req) => {
      for (const book of books) {
        if (book.genre_code === Genre.Fantasy) {
          book.price *= 0.8
        }
      }
    })

    return super.init()
  }
}
