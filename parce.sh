curl -s "https://djari.ru" \
| grep '<script id="vike_pageContext" type="application/json">'\
| sed 's/<[^>]*>//g'\
| jq '.initialStoreState.products.all'\
| jq '[.[] | {  name: .name, price: (.parameters[0].cost | tonumber)}]' > menu.json