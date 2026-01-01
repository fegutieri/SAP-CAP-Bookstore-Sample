using {tutorial.db as db} from '../db/schema';

service BookService {
    entity Books      as projection on db.Books;
    entity Authors    as projection on db.Authors;
    entity Chapters   as projection on db.Chapters;
    entity Bookstatus as projection on db.Bookstatus;

    entity GenreVH    as projection on db.Genres;
}

annotate BookService.Books with @odata.draft.enabled;
