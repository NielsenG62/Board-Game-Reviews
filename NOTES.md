You can search for items from the database by name.

Base URI: /xmlapi2/search?parameters

Parameter Description

query=SEARCH_QUERY Returns all types of Items that match SEARCH_QUERY. Spaces in the SEARCH_QUERY are replaced by a +

type=TYPE Return all items that match SEARCH_QUERY of type TYPE. TYPE might be rpgitem, videogame, boardgame, boardgameaccessory or boardgameexpansion. You can return multiple types by listing them separated by commas, e.g. type=TYPE1,TYPE2,TYPE3

exact=1 Limit results to items that match the SEARCH_QUERY exactly

EX: To find Root id
https://boardgamegeek.com/xmlapi2/search?query=root&type=boardgame&exact=1
Results:

```json
<?xml version="1.0" encoding="utf-8"?>
<items total="1" termsofuse="https://boardgamegeek.com/xmlapi/termsofuse">
    <item type="boardgame" id="237182">
        <name type="primary" value="Root"/>
        <yearpublished value="2018" />
    </item>
</items>
```
