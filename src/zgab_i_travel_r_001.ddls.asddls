@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Model View Entity - Read Only GAB'
@Metadata.allowExtensions:  true
@Search.searchable: true

@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZGAB_I_TRAVEL_R_001
  as select from /DMO/I_Travel_U as Travel
  composition [0..*] of ZGAB_I_BOOKING_001 as _Booking
  
  association [1..1] to /DMO/I_Agency as _Agency on $projection.AgencyID = _Agency.AgencyID
  association [1..1] to /DMO/I_Customer as _Customer    on $projection.CustomerID =   _Customer.CustomerID
  association [0..*] to I_CurrencyText as _CurrencyText on $projection.CurrencyCode = _CurrencyText.Currency
{
      /*key TravelID,
          AgencyID,
          CustomerID,
          BeginDate,
          EndDate,
          @Semantics.amount.currencyCode: 'CurrencyCode'
          BookingFee,
          @Semantics.amount.currencyCode: 'CurrencyCode'
          TotalPrice,*/

  key TravelID,

 @ObjectModel.text.association: '_Agency'
      AgencyID,

@ObjectModel.text.association: '_Customer'
      CustomerID,


    concat_with_space(_Customer.Title, _Customer.LastName, 1) as Addressee,
    //concat_with_space(_Customer.Title, _Customer.LastName, 1) as Addressee,

      BeginDate,


      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      //@Semantics.currencyCode
      //@ObjectModel.text.association: '_CurrencyText'
      CurrencyCode,
      
      Memo,
      Status,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking,
      _Currency,
      _Customer,
      _TravelStatus,
      _CurrencyText
}
