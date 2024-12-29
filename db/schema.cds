using { sap.common.CodeList } from '@sap/cds/common';

namespace myService;

entity OrdersStatusCodeList : CodeList {
    @Common.Text : { $value: name, ![@UI.TextArrangement]: #TextOnly }
  key code : String(20);
  criticality : Integer;
}

entity Books {
  key ID: UUID;
  bookID: String(50) @assert.unique @mandatory;
  title: String(100);
  authorName: String(100);
  price: Decimal;
  quantity: Integer;
  authors: Association to many Authors on authors.books = $self;
  orders: Association to Orders;
}

entity Authors {
  key ID: UUID;
  authorID: String(50) @assert.unique @mandatory;
  name: String(100);
  books: Association to Books;
}

entity Orders {
  key ID: UUID;
  orderID: String(50) @assert.unique @mandatory;
  bookID: String(50);
  status: Association to OrdersStatusCodeList;
  orderQuantity: Integer;
  books: Association to many Books on books.orders = $self;
}
