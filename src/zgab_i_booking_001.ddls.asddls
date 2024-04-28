@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Read-only view from /DMO/I_BOOKING_U'
@Metadata.allowExtensions: true
define view entity ZGAB_I_BOOKING_001
  as select from /DMO/I_Booking_U
  association        to parent ZGAB_I_TRAVEL_R_001 as _Travel     on $projection.TravelID = _Travel.TravelID
  /*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ] }*/
  association [1..1] to /DMO/I_Connection          as _Connection on $projection.ConnectionID = _Connection.ConnectionID
{
  key TravelID,
  key BookingID,
      BookingDate,
      CustomerID,
      AirlineID,
      ConnectionID,
      FlightDate,
      //      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice              as Flight_Price,
      //      @Semantics.currencyCode: true
      CurrencyCode,
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      _Connection.Distance     as Distance,
      _Connection.DistanceUnit as DistanceUnit,
      case
      when _Connection.Distance >= 2000 then 'long-haul flight'
      when _Connection.Distance >= 1000 and
      _Connection.Distance <  2000 then 'medium-haul flight'
      when _Connection.Distance <  1000 then 'short-haul flight'
                    else 'error'
      end                      as Flight_type,

      /* Associations */
      _BookSupplement,
      _Carrier,
      _Connection,
      _Customer,
      _Travel

}
where
  _Connection.DistanceUnit = 'KM'
