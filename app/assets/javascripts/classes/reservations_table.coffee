class @ReservationsTable extends BasicClass

  NEW_RESERVATION_POPUP_SELECTOR: '#new_reservation_modal'
  _initElements: ->
    @newReservationPopup = new NewReservationPopup($container: $(@NEW_RESERVATION_POPUP_SELECTOR))

    @$skedTable = @$container.skedTape(
      caption: 'Стол'
      start: today(12,0)
      end: tomorrow(6, 0)
      showEventTime: true
      showEventDuration: true
      scrollWithYWheel: true
      editMode: true
      canAddIntoLocation: -> true
      locations: [
        {
          id: 1
          name: '4 человека'
        }
        {
          id: 2
          name: '4 человека'
        }
        {
          id: 3
          name: '6 человек'
        }
      ]
      events: []#@convertedReservations()
      formatters:
        date: (date) ->
          $.fn.skedTape.format.date date, 'l', '.'
        duration: (start, end, opts) ->
          $.fn.skedTape.format.duration start, end,
            hrs: 'ч.'
            min: 'мин.'
    )

  _initEvents: ->
    @$skedTable.on 'skedtape:timeline:click', $.proxy @_handleTimelineClick, this
    @$skedTable.on 'skedtape:event:add', $.proxy @_handleEventAdded, this

  _afterInit: ->
    @_fetchEvents()

  _fetchEvents: ->
    $.ajax(
      {
        url: '/reservations.json',
        method: "GET"
      })
    .done $.proxy @_handleFetchEventsResponse, this

  _handleFetchEventsResponse: (response) ->
    @$skedTable.skedTape('setEvents', response)

  _handleEventAdded: (e, api) ->
    newEvent = e.detail.event
    @newReservationPopup.addNewReservation(newEvent)

  _handleTimelineClick: (e, api) ->
    try
      @_log 'ADD'
      @$skedTable.skedTape 'startAdding',
        name: 'Новая бронь'
        duration: 60 * 60 * 1000
    catch e
      if e.name != 'SkedTape.CollisionError'
        throw e
    #alert('Already exists');
    return