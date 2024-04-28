@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZGAB_RAP_R_100ATRAV1 así de simple'
@ObjectModel.semanticKey: [ 'TravelID' ]
@Search.searchable: true
define root view entity ZGAB_RAP_C_100ATRAV1
  provider contract transactional_query
  as projection on ZGAB_RAP_R_100ATRAV1
{
@Search.defaultSearchElement: true
@Search.fuzzinessThreshold: 0.90  
  key TravelID,
  @Search.defaultSearchElement: true
@ObjectModel.text.element: ['AgencyName']
@Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Agency', element: 'AgencyID' } }]
  AgencyID,
  _Agency.Name              as AgencyName,
@Search.defaultSearchElement: true
@ObjectModel.text.element: ['CustomerName']
@Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Customer', element: 'CustomerID'  } }]  
  CustomerID,
  _Customer.LastName        as CustomerName,
  BeginDate,
  EndDate,
  BookingFee,
  TotalPrice,
  @Consumption.valueHelpDefinition: [{ entity: {name: 'I_Currency', element: 'Currency' } }]
  CurrencyCode,
  Description,
  @ObjectModel.text.element: ['OverallStatusText']
  @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Overall_Status_VH', element: 'OverallStatus' } }]
  OverallStatus,
  _OverallStatus._Text.Text as OverallStatusText : localized,   
  Attachment,
  MimeType,
  FileName,
  LocalLastChangedAt
  
}
