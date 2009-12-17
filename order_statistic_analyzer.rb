# -*- coding: utf-8 -*-
require 'statistic_analyzer'

class OrderStatisticAnalyzer
  include StatisticAnalyzer

  def initialize(list, trust_ratio = 1.5)
    init_list(list)
    @trust_ratio = trust_ratio.to_f
  end

  def median
    unless @median
      if size.odd?
        @median = @list[(size+1)/2 - 1].to_f
      else
        ind_u = size/2
        ind_d = size/2-1
        @median = diff_val(ind_d, ind_u, 0.5)
      end
    end
    @median
  end

  def iqr
    @iqr ||= q3 - q1
    @iqr
  end

  def q1
    unless @q1
      raw_ind = ((size + 3).to_f / 4.0) - 1.0
      @q1 = q_val(raw_ind)
    end
    @q1
  end

  def q3
    unless @q3
      raw_ind = ((3 * size + 1).to_f / 4.0) - 1.0
      @q3 = q_val(raw_ind)
    end
    @q3
  end

  def trust_ceil
    @trust_ceil ||= q3 + @trust_ratio * iqr
    @trust_ceil
  end

  def trust_floor
    @trust_floor ||= q1 - @trust_ratio * iqr
    @trust_floor
  end

  private

  def q_val(raw_ind)
    ind_u = raw_ind.ceil
    ind_d = raw_ind.floor
    diff = raw_ind - ind_d.to_f

    diff_val(ind_d, ind_u, diff)
  end

  def diff_val(ind_d, ind_u, diff)
    val_d = @list[ind_d].to_f
    val_u = @list[ind_u].to_f
    val_d + (val_u - val_d) * diff
  end

end
