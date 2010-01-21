# -*- coding: utf-8 -*-
require 'statistic_analyzer'

class StandardDeviationAnalyzer
  include StatisticAnalyzer

  def initialize(list, level = 2.0)
    init_list(list)
    @trust_level = level.to_f
  end

  def ave
    @ave ||= total.to_f / size.to_f
    @ave
  end

  def div
    unless @div
      dt = @list.inject(0){|t, v| t + (v - ave)**2}
      @div = sqrt(dt / size.to_f)
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
