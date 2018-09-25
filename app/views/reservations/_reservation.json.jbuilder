json.extract! reservation, :id
json.start reservation.date_from.to_i*1000
json.end reservation.date_to.to_i*1000
json.name 'Бронь json'
json.location 3
json.url reservation_url(reservation, format: :json)
