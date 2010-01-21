# -*- coding: utf-8 -*-
module StatisticAnalyzer
  include Math

  def size
    @list.size
  end

  def trust_ceil
    0.0
  end

  def trust_floor
    0.0
  end

  def trust?(val)
    return false if val < trust_floor
    return false if val > trust_ceil
    true
  end

  def total
    @total ||= @list.inject(:+)
    @total
  end

  def max
    unless @max
      @list.reverse.each do |val|
        next if val > trust_ceil
        @max = val
        break
      end
    end
    @max
  end

  def raw_max
    @list[-1]
  end

  def min
    unless @min
      @list.each do |val|
        next if val < trust_floor
        @min = val
        break
      end
    end
    @max
  end

  def raw_min
    @list[0]
  end

  def init_list(list)
    @list = list.sort.freeze
  end

end
