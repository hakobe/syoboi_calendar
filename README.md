# SyoboiCalendar

Simple gem for [SyoboiCalendar](http://cal.syoboi.jp/) to search Japanese anime lineup

## Installation

```
$ gem install syoboi_calendar
```

## Usage

```
require "syoboi_calendar"
require "date"

client = SyoboiCalendar.new(
  :user => "r7kamura",
  :pass => "********"
)
programs = client.search(
  :first => true,
  :range => Date.today .. Date.today + 7
)

p programs[0].name         #=> "さんかれあ #1 私が…ゾンビに…なったら"
p programs[0].start_time   #=> 2012-04-06 02:50:00 +0900
p programs[0].channel_name #=> "TBS"
```

## Requirement
* Ruby >= 1.9.2
