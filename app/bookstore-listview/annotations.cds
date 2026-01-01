using BookService as service from '../../srv/service';
annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Title}',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Genre}',
                Value : genre,
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
                Label : '{i18n>Price2}',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Stock}',
                Value : stock,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Statuscode}',
                Value : status_code,
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
            Value : genre,
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
    ],
    UI.SelectionFields : [
        price,
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
    status @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Bookstatus',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : status_code,
                ValueListProperty : 'code',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'criticality',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'displayText',
            },
        ],
    }
};

annotate service.Books with {
    price @Common.Label : '{i18n>Price}'
};

