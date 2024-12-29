using { myService } from '../db/schema.cds';

service myServiceSrv {
  @odata.draft.enabled
  entity Books as projection on myService.Books;
  entity Authors as projection on myService.Authors;
  entity Orders as projection on myService.Orders;
}