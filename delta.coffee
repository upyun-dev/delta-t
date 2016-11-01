calculate_deltas = ({ from: { d, h, m, s, ms } = {}, to: { D, H, M, S, MS } = {} }) ->
  now = new Date()

  d ?= now.getDay()
  h ?= now.getHours()
  m ?= now.getMinutes()
  s ?= now.getSeconds()
  ms ?= now.getMilliseconds()

  delta_d = 0
  delta_h = 0
  delta_m = 0
  delta_s = 0
  delta_ms = 0

  delta_ms = MS - ms if MS?
  delta_s = S - s - (if delta_ms < 0 then 1 else 0) if S?
  delta_m = M - m - (if delta_s < 0 then 1 else 0) if M?
  delta_h = H - h - (if delta_m < 0 then 1 else 0) if H?
  delta_d = D - d - (if delta_h < 0 then 1 else 0) if D?

  [
    delta_d %%= 7
    delta_h %%= 24
    delta_m %%= 60
    delta_s %%= 60
    delta_ms %%= 1000
  ]

module.exports = calculate_deltas