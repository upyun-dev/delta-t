## Usage

基于固定周期时间段(天, 时, 分, 秒, 毫秒)计算任意两个时间点的时间差.

```coffee
{ humanize, ms } = require './delta'

# 示例: 计算从现在开始到最近一个日期的下午 5 点的时差.

# 以人类友好格式显示
now = new Date
humanize 
  from: h: now.getHours()
  to: h: 17

# 返回毫秒时间差
ms
  from: h: now.getHours()
  to: h: 17
```

## API

```coffee
humanize({ from: { d, h, m, s, ms }, to: { d, h, m, s, ms } })
ms({ from: { d, h, m, s, ms }, to: { d, h, m, s, ms } })
```