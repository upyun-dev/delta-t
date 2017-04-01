UNITS = [
  1000
  60
  60
  24
  7
]

calculate = ({ from: { d, h, m, s, ms }, to: { d: D, h: H, m: M, s: S, ms: MS } }) ->
  lst = [
    [ms, MS]
    [s, S]
    [m, M]
    [h, H]
    [d, D]
  ]

  accumulate = 0
  for [start, end], i in lst
    delta = if end? and start? then end - start - accumulate else 0
    accumulate = if delta < 0 then 1 else 0
    delta %% UNITS[i]

exports.humanize = (cfg) -> calculate(cfg).reverse()
exports.ms = (cfg) -> 
  calculate(cfg).reduce (accumulate, delta, i) -> accumulate + delta * UNITS[..i-1].reduce (a, b) -> a * b