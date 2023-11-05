use context essentials2021
# norway dim -- h 6:1:2:1:12/v 6:1:2:1:6
# sweden dim -- h 5:2:9/v 4:2:4
# denmark dim -- h 12:4:21/v 12:4:12
# finland dim -- h 5:3:10/v 4:3:4
# iceland dim -- h 7:1:2:1:14/v 7:1:2:1:7
# faroe islands dim -- h 6:1:2:1:12/v 6:1:2:1:6

# Først definerer jeg alle flaggbildene i henhold til deres dimensjoner:

norway-flag = frame(
  put-image(rectangle(2, 16, "solid", "blue"), 8, 8, 
    put-image(rectangle(22, 2, "solid", "blue"), 11, 8, 
      put-image(rectangle(4, 16, "solid", "white"), 8, 8, 
        put-image(rectangle(22, 4, "solid", "white"), 11, 8, rectangle(22, 16, "solid", "red"))))))

sweden-flag = frame(
  put-image(rectangle(2, 10, "solid", "yellow"), 5, 5, 
    put-image(rectangle(16, 2, "solid", "yellow"), 8, 5, rectangle(16, 10, "solid", "blue"))))
  
denmark-flag = frame(
  put-image(rectangle(4, 28, "solid", "white"), 13.5, 14, 
    put-image(rectangle(37, 4, "solid", "white"), 18.5, 14, rectangle(37, 28, "solid", "red"))))
  
finland-flag = frame(
  put-image(rectangle(3, 11, "solid", "blue"), 6, 5.5, 
    put-image(rectangle(18, 3, "solid", "blue"), 9, 5.5, rectangle(18, 11, "solid", "white"))))
  
iceland-flag = frame(
  put-image(rectangle(2, 18, "solid", "red"), 8.5, 9, 
    put-image(rectangle(25, 2, "solid", "red"), 12, 9, 
      put-image(rectangle(4, 18, "solid", "white"), 8.5, 9, 
        put-image(rectangle(25, 4, "solid", "white"), 12, 9, rectangle(25, 18, "solid", "blue"))))))
  
faroe-islands-flag = frame(
  put-image(rectangle(2, 16, "solid", "red"), 8, 8, 
    put-image(rectangle(22, 2, "solid", "red"), 11, 8, 
      put-image(rectangle(4, 16, "solid", "blue"), 8, 8, 
        put-image(rectangle(22, 4, "solid", "blue"), 11, 8, (rectangle(22, 16, "solid", "white")))))))

# Så har jeg brukt en tabell til å presentere hvilke flagg fra hvilke land man kan lage.

"Here's a table of countries you can create flags to!"

nordic-countries = table: Countries :: String
  row: "Norway"
  row: "Sweden"
  row: "Denmark"
  row: "Finland"
  row: "Iceland"
  row: "Faroe Islands"
end

nordic-countries

"Please use the create-nordic-flag function"

# Her har jeg laget en funksjon som tar input "country" -- en string-verdi.
#
# Funksjonen konverterer all input til lowercase, og sjekker om input tilsvarer et av landene i 
# tabellen (også kovertert til lowercase, for å matche input).
#
# Funksjonen genererer et bilde av et flagg basert på landet oppgitt som argument. 
# Den skalerer og bildet til en størrelse som er mer synlig enn deres originale størrelse.

fun create-nordic-flag(country :: String):
  doc: ```creates an image of the flag to the inputted country```
  if string-to-lower(country) == string-to-lower(nordic-countries.row-n(0)["Countries"]):
    scale(10, norway-flag)
  else if string-to-lower(country) == string-to-lower(nordic-countries.row-n(1)["Countries"]):
    scale(10, sweden-flag)
  else if string-to-lower(country) == string-to-lower(nordic-countries.row-n(2)["Countries"]):
    scale(10, denmark-flag)
  else if string-to-lower(country) == string-to-lower(nordic-countries.row-n(3)["Countries"]):
    scale(10, finland-flag)
  else if string-to-lower(country) == string-to-lower(nordic-countries.row-n(4)["Countries"]):
    scale(10, iceland-flag)
  else if string-to-lower(country) == string-to-lower(nordic-countries.row-n(5)["Countries"]):
    scale(10, faroe-islands-flag)
  else:
    "Please check your spelling of country input and try again!"
  end
where:
  create-nordic-flag("nORwaY") is scale(10, norway-flag)
  create-nordic-flag("dsjhfgb") is "Please check your spelling of country input and try again!"
end

# Jeg kunne også ha definert flaggene i funksjonen, men testen min i
#
# create-nordic-flag("nORwaY") is scale(10, norway-flag)
#
# Hadde dermed måtte se sånn ut: 
#
# create-nordic-flag("nORwaY") is scale(10, frame(
#  put-image(rectangle(2, 16, "solid", "blue"), 8, 8, 
#    put-image(rectangle(22, 2, "solid", "blue"), 11, 8, 
#      put-image(rectangle(4, 16, "solid", "white"), 8, 8, 
#        put-image(rectangle(22, 4, "solid", "white"), 11, 8, rectangle(22, 16, "solid", "red")))))))
#
# Som både gjentar kode, og ikke representerer leselig output skrevet i if-setningen. 