Feature: Gilded Rose behaviour of the legacy code

Scenario: Aged Brie increases in quality the older it gets
	Given an item named "Aged Brie" with quality 9 and which has to be sold in 11 days
	When a day has passed
	Then it has to be sold in 10 days
	And its quality is 10

Scenario: Aged brie keeps increasing even more in quality when expired until sold
	Given an item named "Aged Brie" with quality 20 and which has to be sold in -1 days
	When a day has passed
	Then it has to be sold in -2 days
	And its quality is 22

Scenario: Aged brie keeps increasing in quality even when expired until sold, but not above 50
	Given an item named "Aged Brie" with quality 50 and which has to be sold in -1 days
	When a day has passed
	Then it has to be sold in -2 days
	And its quality is 50

Scenario: Once the sell by date has passed, Quality degrades twice as fast
	Given an item named "Banana" with quality 10 and which has to be sold in -1 days
	When a day has passed
	Then it has to be sold in -2 days
	And its quality is 8

Scenario: The Quality of an item is never negative
	Given an item named "Bread" with quality 0 and which has to be sold in 2 days
	When a day has passed
	Then it has to be sold in 1 days
	And its quality is 0

Scenario: The Quality of an item is never negative and will not be removed
	Given an item named "Bread" with quality 0 and which has to be sold in 0 days
	When a day has passed
	Then it has to be sold in -1 days
	And its quality is 0



Scenario: The Quality of an item is never more than 50 (Not even Aged Brie)
	Given an item named "Aged Brie" with quality 50 and which has to be sold in 20 days
	When a day has passed
	Then it has to be sold in 19 days
	And its quality is 50

Scenario: Sulfuras is legendary and never need to be sold, nor decrease in value of 80
	Given an item named "Sulfuras, Hand of Ragnaros" with quality 80 and which has to be sold in 20 days
	When a day has passed
	Then it has to be sold in 20 days
	And its quality is 80

Scenario: Sulfuras is legendary and never need to be sold, nor decrease in value of 80
	Given an item named "Sulfuras, Hand of Ragnaros" with quality 80 and which has to be sold in -2 days
	When a day has passed
	Then it has to be sold in -2 days
	And its quality is 80

Scenario: Backstage passes is normal when there is still long until expiration.
	Given an item named "Backstage passes to a TAFKAL80ETC concert" with quality 10 and which has to be sold in 15 days
	When a day has passed
	Then it has to be sold in 14 days
	And its quality is 11

Scenario: Backstage passes get better closer to expiration.
	Given an item named "Backstage passes to a TAFKAL80ETC concert" with quality 10 and which has to be sold in 10 days
	When a day has passed
	Then it has to be sold in 9 days
	And its quality is 12

Scenario: Backstage passes get better closer to expiration, but not better than 50.
	Given an item named "Backstage passes to a TAFKAL80ETC concert" with quality 50 and which has to be sold in 10 days
	When a day has passed
	Then it has to be sold in 9 days
	And its quality is 50

Scenario: Backstage passes get very good close to expiration.
	Given an item named "Backstage passes to a TAFKAL80ETC concert" with quality 10 and which has to be sold in 5 days
	When a day has passed
	Then it has to be sold in 4 days
	And its quality is 13

Scenario: Backstage passes get very good close to expiration, but not better than 50.
	Given an item named "Backstage passes to a TAFKAL80ETC concert" with quality 50 and which has to be sold in 5 days
	When a day has passed
	Then it has to be sold in 4 days
	And its quality is 50

Scenario: Backstage passes are worthless after the concert.
	Given an item named "Backstage passes to a TAFKAL80ETC concert" with quality 30 and which has to be sold in 0 days
	When a day has passed
	Then it has to be sold in -1 days
	And its quality is 0

Scenario: Not even backstage passes can get better than 50
	Given an item named "Backstage passes to a TAFKAL80ETC concert" with quality 50 and which has to be sold in 5 days
	When a day has passed
	Then it has to be sold in 4 days
	And its quality is 50
	
