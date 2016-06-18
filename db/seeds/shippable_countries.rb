countries = ["Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Antigua", "Argentina", "Arguilla",
             "Armenia", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus",
             "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bonaire", "Bosnia and Herzegovina", "Botswana",
             "Brazil", "Brunei", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Canary Islands",
             "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Colombia", "Comoros",
             "Congo", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia", "Cuba", "Curacao", "Cyprus", "Czech Republic",
             "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador",
             "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands", "Faroe Islands", "Fiji", "Finland",
             "France", "French Guyana", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland",
             "Grenada", "Guadalope", "Guam", "Guatemala", "Guernsey", "Guinea Republic", "Guinea-Bissau", "Guyana", "Haiti",
             "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Israel",
             "Italy", "Jamaica", "Japan", "Jersey", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, north", "Korea, south",
             "Kosovo", "Kuwait", "Kyrgyzstan", "Lao PDR", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein",
             "Lithuania", "Luxembourg", "Macau", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta",
             "Marshall Islands", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia",
             "Monstrerrat", "Montenegro", "Morocco", "Mozambique", "Myanmar (Burma)", "Namibia", "Nauru", "Nepal", "Netherlands",
             "Nevis", "New Calendonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norway", "Oman", "Pakistan",
             "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion",
             "Romania", "Russia Federation", "Rwanda", "Saint Helena", "Common wealth Mariana Island", "Samoa", "San Marino",
             "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia",
             "Slovenia", "Solomon Islands", "Somalia", "Somaliand (North Somalia)", "South Sudan", "Spain", "Sri Lanka",
             "St. Barthelemy", "St. Eustalius", "St. Kitts", "St. Lucia", "St. Maartem", "St. Vincent", "Sudan", "Suriname",
             "Swaziland", "Sweden", "Switzerland", "Syria", "Tahiti", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Togo",
             "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turk & Caicos Islands", "Tuvalu", "Uganda", "Ukraine",
             "United Arab Emirates", "United Kingdom", "Uruguay", "USA", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam",
             "Virgin Islands (British)", "Virgin Islands (US)", "Yemen", "Zambia", "Zimbabwe"]

zones = ["10", "8", "10", "10", "8", "10", "10", "10", "10", "8", "10", "4", "8", "10", "8", "5", "10", "8", "8", "10",
         "10", "10", "5", "10", "8", "8", "10", "10", "2", "8", "10", "10", "3", "10", "7", "10", "10", "10", "10", "10",
         "10", "3", "10", "10", "10", "10", "10", "10", "8", "10", "10", "8", "8", "8", "10", "10", "10", "4", "10", "10",
         "10", "10", "10", "8", "10", "10", "8", "10", "8", "8", "10", "10", "10", "8", "8", "10", "8", "8", "10", "10",
         "10", "4", "10", "8", "10", "10", "10", "10", "10", "1", "8", "8", "5", "2", "9", "10", "8", "10", "8", "10",
         "2", "8", "9", "10", "10", "10", "10", "2", "8", "9", "10", "3", "8", "10", "10", "10", "10", "8", "8", "8",
         "1", "8", "10", "10", "2", "4", "10", "8", "10", "10", "10", "10", "7", "9", "8", "8", "4", "8", "10", "10",
         "10", "5", "10", "10", "5", "8", "10", "10", "4", "10", "10", "10", "10", "8", "9", "9", "10", "10", "4", "10",
         "10", "8", "8", "10", "9", "10", "8", "9", "10", "10", "10", "10", "10", "10", "9", "10", "8", "10", "10", "1",
         "8", "8", "10", "10", "10", "10", "8", "5", "10", "10", "10", "10", "10", "10", "10", "10", "10", "8", "8", "10",
         "10", "1", "10", "10", "2", "10", "10", "10", "10", "8", "10", "10", "10", "8", "9", "8", "10", "7", "8", "10",
         "10", "3", "10", "10", "9", "10", "10"]


countries.each_with_index do |name, index|
  ShippableCountry.create!(name: name, zone_id: zones[index].to_i)
end
