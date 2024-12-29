using { myServiceSrv } from '../../srv/service.cds';

annotate myServiceSrv.Books with {
  orders @Common.ValueList: {
    CollectionPath: 'Orders',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: orders_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'orderID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'bookID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'status_code'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'orderQuantity'
      },
    ],
  }
};
annotate myServiceSrv.Books with @UI.DataPoint #title: {
  Value: title,
  Title: 'Title',
};
annotate myServiceSrv.Books with @UI.DataPoint #authorName: {
  Value: authorName,
  Title: 'Author Name',
};
annotate myServiceSrv.Books with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#title', ID: 'Title' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#authorName', ID: 'AuthorName' }
];
annotate myServiceSrv.Books with @UI.HeaderInfo: {
  TypeName: 'Book',
  TypeNamePlural: 'Books',
  Title: { Value: bookID }
};
annotate myServiceSrv.Books with {
  ID @UI.Hidden
};
annotate myServiceSrv.Books with @UI.Identification: [{ Value: bookID }];
annotate myServiceSrv.Books with {
  bookID @Common.Label: 'Book ID';
  title @Common.Label: 'Title';
  authorName @Common.Label: 'Author Name';
  price @Common.Label: 'Price';
  quantity @Common.Label: 'Quantity';
  authors @Common.Label: 'Authors';
  orders @Common.Label: 'Order'
};
annotate myServiceSrv.Books with {
  ID @Common.Text: { $value: bookID, ![@UI.TextArrangement]: #TextOnly };
  orders @Common.Text: { $value: orders.orderID, ![@UI.TextArrangement]: #TextOnly };
};
annotate myServiceSrv.Books with @UI.SelectionFields : [
 title,
 authorName,
 price,
 quantity
];
annotate myServiceSrv.Books with @UI.LineItem : [
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: authorName },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: quantity }
];
annotate myServiceSrv.Books with @UI.FieldGroup #bookDetails: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: bookID },
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: authorName },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Value: quantity }

  ]
};


annotate myServiceSrv.Authors with @UI.LineItem #authorsSection: [
    { $Type: 'UI.DataField', Value: authorID },
    { $Type: 'UI.DataField', Value: name }

  ];


annotate myServiceSrv.Books with @UI.Facets: [
  {
    $Type: 'UI.CollectionFacet',
    ID: 'mainTab',
    Label: 'Main',
    Facets: [
      { $Type: 'UI.ReferenceFacet', ID: 'bookDetails', Label: 'Book Details', Target: '@UI.FieldGroup#bookDetails' },
      { $Type: 'UI.ReferenceFacet', ID: 'authorsSection', Label: 'Authors', Target: 'authors/@UI.LineItem#authorsSection' } ]
  }
];
annotate myServiceSrv.Authors with {
  books @Common.ValueList: {
    CollectionPath: 'Books',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: books_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'bookID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'title'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'authorName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'price'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'quantity'
      },
    ],
  }
};
annotate myServiceSrv.Authors with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate myServiceSrv.Authors with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name', ID: 'Name' }
];
annotate myServiceSrv.Authors with @UI.HeaderInfo: {
  TypeName: 'Author',
  TypeNamePlural: 'Authors',
  Title: { Value: authorID }
};
annotate myServiceSrv.Authors with {
  ID @UI.Hidden
};
annotate myServiceSrv.Authors with @UI.Identification: [{ Value: authorID }];
annotate myServiceSrv.Authors with {
  authorID @Common.Label: 'Author ID';
  name @Common.Label: 'Name';
  books @Common.Label: 'Book'
};
annotate myServiceSrv.Authors with {
  ID @Common.Text: { $value: authorID, ![@UI.TextArrangement]: #TextOnly };
  books @Common.Text: { $value: books.bookID, ![@UI.TextArrangement]: #TextOnly };
};
annotate myServiceSrv.Authors with @UI.SelectionFields: [
  books_ID
];
annotate myServiceSrv.Authors with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: authorID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Label: 'Book', Value: books_ID }
];
annotate myServiceSrv.Authors with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: authorID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Label: 'Book', Value: books_ID }
]};
annotate myServiceSrv.Authors with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];
annotate myServiceSrv.Orders with @UI.DataPoint #bookID: {
  Value: bookID,
  Title: 'Book ID',
};
annotate myServiceSrv.Orders with @UI.DataPoint #status: {
  Value: status_code,
  Title: 'Status',
  Criticality: status.criticality,
};
annotate myServiceSrv.Orders with @UI.DataPoint #orderQuantity: {
  Value: orderQuantity,
  Title: 'Order Quantity',
};
annotate myServiceSrv.Orders with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#bookID', ID: 'BookID' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#status', ID: 'Status' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#orderQuantity', ID: 'OrderQuantity' }
];
annotate myServiceSrv.Orders with @UI.HeaderInfo: {
  TypeName: 'Order',
  TypeNamePlural: 'Orders',
  Title: { Value: orderID }
};
annotate myServiceSrv.Orders with {
  ID @UI.Hidden
};
annotate myServiceSrv.Orders with @UI.Identification: [{ Value: orderID }];
annotate myServiceSrv.Orders with {
  orderID @Common.Label: 'Order ID';
  bookID @Common.Label: 'Book ID';
  status @Common.Label: 'Status';
  orderQuantity @Common.Label: 'Order Quantity';
  books @Common.Label: 'Books'
};
annotate myServiceSrv.Orders with {
  ID @Common.Text: { $value: orderID, ![@UI.TextArrangement]: #TextOnly };
  status @Common.Text : { $value: status.name, ![@UI.TextArrangement]: #TextOnly };
};
annotate myServiceSrv.Orders with {
  status @Common.ValueListWithFixedValues;
};
annotate myServiceSrv.Orders with @UI.SelectionFields: [
  orderID,
  status_code
];
annotate myServiceSrv.Orders with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: orderID },
    { $Type: 'UI.DataField', Value: bookID },
    { $Type: 'UI.DataField', Value: status_code, Criticality: status.criticality },
    { $Type: 'UI.DataField', Value: orderQuantity }
];
annotate myServiceSrv.Orders with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: orderID },
    { $Type: 'UI.DataField', Value: bookID },
    { $Type: 'UI.DataField', Value: status_code, Criticality: status.criticality },
    { $Type: 'UI.DataField', Value: orderQuantity }
]};
annotate myServiceSrv.Orders with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];