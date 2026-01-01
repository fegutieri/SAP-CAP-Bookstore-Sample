using BookService as service from '../../srv/service';
annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : 'Book Name',
            },
            {
                $Type : 'UI.DataField',
                Value : genre_code,
                Label : 'Genre',
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Publishedat}',
                Value : publishedAt,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Pages}',
                Value : pages,
            },
            {
                $Type : 'UI.DataField',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Value : currency_code,
                Label : 'Currency',
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Statuscode}',
                Value : status_code,
                Criticality : status.criticality,
                CriticalityRepresentation : #WithIcon,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Stock}',
                Value : stock,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : '{i18n>GeneralInformation}',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>EntryInformation}',
            ID : 'EntryInformation',
            Target : '@UI.FieldGroup#EntryInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Chapters}',
            ID : 'Chapters',
            Target : 'Chapters/@UI.LineItem#Chapters',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Title}',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Genre}',
            Value : genre_code,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Price1}',
            Value : price,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Publishedat}',
            Value : publishedAt,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Pages}',
            Value : pages,
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : '{i18n>Stock}',
        },
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : '{i18n>Status}',
            Criticality : status.criticality,
            CriticalityRepresentation : #WithIcon,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookService.addStock',
            Label : 'Add Stock',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookService.changePublishDate',
            Label : 'Change Publish Date',
        },
    ],
    UI.SelectionFields : [
        price,
        status_code,
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '{i18n>Book}',
        TypeNamePlural : '{i18n>Books}',
        Description : {
            $Type : 'UI.DataField',
            Value : genre_code,
        },
        TypeImageUrl : 'sap-icon://course-book',
    },
    UI.FieldGroup #EntryInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
                Label : '{i18n>CreatedAt}',
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
                Label : '{i18n>UserID}',
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
                Label : '{i18n>ChangedAt}',
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
                Label : '{i18n>UserID}',
            },
        ],
    },
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookService.addStock',
            Label : 'addStock',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookService.changePublishDate',
            Label : 'Change Publish Date',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookService.changeStatus',
            Label : 'Change Status',
        },
    ],
);

annotate service.Books with {
    author @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Authors',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : author_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
        ],
    }
};

annotate service.Books with {
    status @(
        Common.Text : status.displayText,
        Common.Label : '{i18n>Status}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Bookstatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : status_code,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
        Common.Text.@UI.TextArrangement : #TextOnly,
        )
};

annotate service.Books with {
    price @Common.Label : '{i18n>Price}'
};

annotate service.Chapters with @(
    UI.LineItem #Chapters : [
        {
            $Type : 'UI.DataField',
            Value : book.Chapters.number,
            Label : '{i18n>Number}',
        },
        {
            $Type : 'UI.DataField',
            Value : book.Chapters.title,
            Label : '{i18n>Title1}',
        },
        {
            $Type : 'UI.DataField',
            Value : book.Chapters.pages,
            Label : '{i18n>Pages}',
        },
    ]
);

annotate service.Bookstatus with {
    code @(
        Common.Text : displayText,
        Common.Text.@UI.TextArrangement : #TextOnly,
    )
};

annotate service.Books with {
    currency @Common.ValueListWithFixedValues : true
};

annotate service.Books with {
    genre @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'GenreVH',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : genre_code,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
)};

