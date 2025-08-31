get_menu(){
    local url="$1"
    local filename=$(echo "$url" | sed -e 's|https:||' -e 's|/||g')_menu.json

    curl -s "$url" \
    | grep '<script id="vike_pageContext" type="application/json">'\
    | sed 's/<[^>]*>//g'\
    | jq '.initialStoreState.products.all'\
    | jq '[.[] | {  name: .name, price: (.parameters[0].cost | tonumber)}]' > "$filename"
}

get_menu "$1"