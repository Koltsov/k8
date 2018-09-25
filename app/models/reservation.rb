class Reservation < ApplicationRecord


  def self.for_shift(dt = nil)
    shift_starts, shift_ends = nil

    if dt.is_a?(Date)
      # если пришла дата, то это вероятно фильтрация по смене.
      dt = DateTime.new(dt.year, dt.month, dt.day, 13)
    else
      dt = DateTime.now
    end
    # иначе просто текущая смена

    if dt.hour <= 6
      # сейчас идет ночь ткекущей смены
      shift_starts = DateTime.new(dt.year, dt.month, dt.day, 12) - 1.day
      shift_ends = DateTime.new(dt.year, dt.month, dt.day, 6)
    else
      #   сейчас идет вечер текущей смены
      shift_starts = DateTime.new(dt.year, dt.month, dt.day, 12)
      shift_ends = DateTime.new(dt.year, dt.month, dt.day, 6) + 1.day
    end
    where('date_from >= ?', shift_starts)
        .where('date_to <= ?', shift_ends)
  end
end
