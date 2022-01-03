Feature: New supplier with conjured items

Scenario: Conjured items degrade in quality twice as fast as normal items
  Given an item named "Conjured" with quality 10 and which has to be sold in 10 days
  When a day has passed
  Then it has to be sold in 9 days
  And its quality is 8

Scenario: Conjured items degrade in quality twice as fast as normal items, also when expired.
  Given an item named "Conjured" with quality 10 and which has to be sold in -1 days
  When a day has passed
  Then it has to be sold in -2 days
  And its quality is 6