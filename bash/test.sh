version="v123.0.6"
extracted_digit=$(echo "$version" | awk -F'[v.]' '{print $2}')
echo "$extracted_digit"
