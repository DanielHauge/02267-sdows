package com.gildedrose;

class GildedRose {
    Item[] items;

    public GildedRose(Item[] items) {
        this.items = items;
    }

    public void updateQuality(){
        for (int i = 0; i < items.length; i++) {
            items[i].sellIn = items[i].sellIn - 1;
            switch (items[i].name){
                case "Aged Brie":
                    items[i].quality++;
                    if (items[i].sellIn < 0) items[i].quality++;
                    if (items[i].quality > 50) items[i].quality = 50;
                    break;

                case "Backstage passes to a TAFKAL80ETC concert":
                    items[i].quality++;
                    if (items[i].sellIn <= 10) items[i].quality++;
                    if (items[i].sellIn <= 5) items[i].quality++;
                    if (items[i].sellIn <= 0) items[i].quality = 0;
                    if (items[i].quality > 50) items[i].quality = 50;
                    break;

                case "Sulfuras, Hand of Ragnaros":
                    items[i].sellIn++;
                    items[i].quality = 80;
                    break;

                case "Conjured":
                    items[i].quality--;
                    if (items[i].sellIn < 0) items[i].quality--;
                    if (items[i].quality < 0) items[i].quality = 0;
                    // No break, to go into default case too.

                default:
                    items[i].quality--;
                    if (items[i].sellIn < 0) items[i].quality--;
                    if (items[i].quality < 0) items[i].quality = 0;
            }
        }
    }
}