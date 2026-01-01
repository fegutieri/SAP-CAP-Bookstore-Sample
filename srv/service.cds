using {tutorial.db as db} from '../db/schema';

service BookService {
    entity Books      as projection on db.Books
        actions {
            @(Common.SideEffects: {TargetProperties: ['stock']})
            action addStock();
            action changePublishDate(newDate: Date);
            @(Common.SideEffects: {TargetProperties: ['status_code']})
            action changeStatus( @(Common: {
                                     Label                   : 'New Status',
                                     ValueListWithFixedValues: true,
                                     ValueList               : {
                                         $Type         : 'Common.ValueListType',
                                         CollectionPath: 'Bookstatus',
                                         Parameters    : [{
                                             $Type            : 'Common.ValueListParameterInOut',
                                             LocalDataProperty: newStatus,
                                             ValueListProperty: 'code',
                                         }, ],
                                     },
                                 })
                                 newStatus: String)
        };

    entity Authors    as projection on db.Authors;
    entity Chapters   as projection on db.Chapters;
    entity Bookstatus as projection on db.Bookstatus;

    entity GenreVH    as projection on db.Genres;
}

annotate BookService.Books with @odata.draft.enabled;
