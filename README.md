focus-fengshui.de Web Site
==========================

Pflege der Inhalte
------------------

1. **Vorbereitung**:
   Terminal.app starten und mittels `cd ~/Sites/focus-fengshui.de`
   in das Projektverzeichnis wechseln.

2. **Inhalte editieren**:
   Die Inhalte liegen im Verzeichnis `content/` vom Programm Text Wrangler (diesem hier!) und können zum Beispiel im
   Markdown-Format erstellt werden, vgl. [Markdown Syntax](http://kramdown.rubyforge.org/quickref.html).
   Dateien im Markdown-Format müssen die Endung .html.md erhalten.

3. **Seitenvorschau**:
   Im Terminal `rake watch` ausführen und im Webbrowser die Vorschau unter
   <http://localhost:3000> aufrufen (ohne dass es bereits im Internet aktualisiert wurde).

4. **Seite publizieren**:
   Das im Terminal ggf. laufende `rake watch` aus Schritt 3 kann mit `Ctrl+C`
   beendet werden. Mittels `rake publish` wird die Veröffentlichung gestartet.
   Zuvor werden die Links der Web Site überprüft. Wenn alle Links passen, werden als
   nächstes die vorgenommenen Änderungen protokolliert ("committed").
   Es öffnet sich ein Editor-Fenster, in dem eine kurze Beschreibung der
   vorgenommenen Änderungen eingegeben werden muss (gleich oben beim Cursor). Der Vorgang wird fortgesetzt,
   wenn das Editor-Fenster gespeichert und geschlossen wurde.
   Als letzter Schritt werden alle Änderungen zum Webhosting bei Amazon hochgeladen.


Einmaliges Setup
----------------

* git clone git@glnetworks.office-on-the.net:focus-fengshui.de
* Ruby/Gems: rvm use ree@focus-fengshui
* gem install bundler -v 1.0.10
* bundle install
