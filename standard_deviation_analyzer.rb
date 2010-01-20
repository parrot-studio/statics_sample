# -*- coding: utf-8 -*-
require 'statistic_analyzer'

class StandardDeviationAnalyzer
  include StatisticAnalyzer

  def initialize(list, level = 2.0)
    init_list(list)
    @trust_level = level.to_f
  end

  def ave
    unless @ave
      total = 0
      @list.each{|val| total += val}
      @ave = total.to_f / size.to_f
    end
    @ave
  end

  def div
    unless @div
      total = 0
      @list.each{|val| total += (val - ave)**2}
      @div = sqrt(total.to_f / size.to_f)
    end
    @div
  end

  def trust_ceil
    @trust_ceil ||= ave + @trust_level * div
    @trust_ceil
  end

  def trust_floor
    @trust_floor ||= ave - @trust_level * div
    @trust_floor
  end

end
