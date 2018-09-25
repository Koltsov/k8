class @NewReservationPopup extends BasicClass


  addNewReservation: (reservation) ->
    @_log 'addNewReservation'
    @_log reservation
    @$container.modal()