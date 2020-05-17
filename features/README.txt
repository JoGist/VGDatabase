N.B. Sto coso è più rompipalle di Rails, fa storie se usi prefissi troppo simili, apici singoli o doppi (fateci bene attenzione) ed è case-sensitive,
quindi se ho usato una certa punteggiatura è perché voleva esattamente quella altrimenti non trova l'elemento da cliccare/visitare.

L'istruzione "Given I am on [...] " indica il punto di partenza dello scenario, prevede che venga messa una pagina nel parametro con path
specificata nel file /support/paths.rb

L'istruzione "When I follow ["..."]" indica un link (link_to o link href di haml/html) in cui capybara clicca e visita il link associato,
quindi il path che esplora lo trova direttamente nel link e non va specificato

L'istruzione "Then I should be on [...]" indica il risultato che ci si aspetta a seguito di una (o più) istruzioni precedenti,
in questo caso ho usato la specifica che si aspetta di essere reindirizzato ad una pagina

L'istruzione "When I fill in ["..."] with ["..."]" prende come primo parametro il campo (nel nostro caso della form) da riempire,
e come secondo parametro cosa metterci dentro

L'istruzione "And [...]" viene utilizzata per continuare ad eseguire tipologie di istruzioni (follow, fill in, ...) rimanendo nella stessa pagina,
in questo caso l'ho usata per riempire più campi delle form

L'istruzione "And I press ["..."]" ricerca un bottone nella pagina avente identificato (nome o id) il parametro passato

L'istruzione "And I should see ["..."]" si aspetta di trovare il parametro passato all'interno della pagina, proprio graficamente

Per lanciarlo va fatto da terminale dalla cartella principale "-$ cucumber ./features/*.feature"

Per sistemare la show delle ultime 2 scenari basta lanciarli tutti insieme una volta e vedere l'id finale