# Skript des Tages (30. Oktober 2025)
#### 🖋️  **Dateiinhalts-Suche & Bericht**
#### **Übersicht**
Dieses PowerShell-Skript sucht in einem bestimmten Verzeichnis nach Dateien, prüft, ob sie ein Schlüsselwort (z. B. "prompt") enthalten, und erstellt einen CSV-Bericht, der die übereinstimmenden Dateien auflistet. Es ist ideal, um Dateien schnell zu prüfen, ohne manuell Ordner durchsuchen zu müssen.

**✅ Sicherheit:** Das Skript **modifiziert, löscht oder verändert keine Dateien**. Es liest nur Daten und erstellt einen Bericht.

**❌ Haftungsauschluss:**
> Dieses Skript wird ohne jegliche Gewährleistung bereitgestellt. Die Nutzung erfolgt auf eigene Verantwortung. Der Autor übernimmt keinerlei Haftung für Schäden oder Datenverluste, die durch die Verwendung dieses Skripts entstehen können.  
> Das Skript greift lediglich lesend auf Benutzerdateien zu und erstellt eine CSV-Datei, nimmt jedoch keine Veränderungen an bestehenden Daten vor. Bitte prüfen Sie das Skript vor der Ausführung sorgfältig und verwende es nur in einer geeigneten Umgebung.  
> 
> Mit der Nutzung des Skripts akzeptieren Sie diesen Haftungsausschluss.

**© Lizenz:** Das Script wird zur freien Verwendung zur Verfügung gestellt 

https://creativecommons.org/publicdomain/zero/1.0/

--------------------------------------------------------------------------------

#### **Quelltext des Skripts**

Der Quelltext befindet sich in der Datei "FileContentSearch.ps1"

--------------------------------------------------------------------------------

#### **Anwendung**
##### **Schritt 1: Laden Sie das Skript auf Ihrem Computer herunter**
Beim Herunterladen achten Sie bitte darauf, dass die Dateierweiterung **ps1** lautet.

--------------------------------------------------------------------------------

##### **Schritt 2: Führen Sie das Skript aus**
###### **Option A: Ausführen per Rechtsklick (am einfachsten)**
1. Suchen Sie die gespeicherte Datei FileContentSearch.ps1.
2. **Rechtsklick** auf die Datei → **Mit PowerShell ausführen**.

###### **Option B: Ausführen über PowerShell**
1. Öffnen Sie **PowerShell** (suchen Sie im Startmenü nach powershell).
2. Navigieren Sie zum Ordner des Skripts:
3. Führen Sie das Skript aus:

--------------------------------------------------------------------------------

##### **Schritt 3: Passen Sie das Skript an (Optional)**
Beim Ausführen des Skripts können Sie das Verhalten mithilfe von **Parametern anpassen**. Hier erfahren Sie, wie:

###### **Beispielbefehle**
```
| **Ziel**                                          | **Befehl**                                                   |
| **In einem anderen Ordner suchen**                | `.\FileContentSearch.ps1 -SourceDirectory "C:\MyProjects"`   |
| **Ein anderes Schlüsselwort finden**              | `.\FileContentSearch.ps1 -Keyword "confidential"`            |
| **Nur .log-Dateien suchen**                       | `.\FileContentSearch.ps1 -FileExtensions *.log`              |
| **Den Bericht an einem bestimmten Ort speichern** | `.\FileContentSearch.ps1 -OutputPath "D:\Reports\files.csv"` |
```
###### **Vollständige Parameterliste**
```
| **Parameter**   | **Beschreibung**                                         | **Standardwert**         |
| SourceDirectory | Das Verzeichnis, in dem gesucht werden soll              | C:\Users\UserX\Documents |
| Keyword         | Wort/Phrase, nach der in den Dateien gesucht werden soll | prompt                   |
| FileExtensions  | Einzuschließende Dateitypen (durch ; getrennt)           | \*.txt;\*.md;\*.html     |
| OutputPath      | Pfad zum Speichern des CSV-Berichts                      | .\matching_files.csv     |
```
--------------------------------------------------------------------------------

##### **Schritt 4: Sehen Sie sich den Bericht an**
Nach dem Ausführen erstellt das Skript eine Datei namens `matching_files.csv` (oder Ihren benutzerdefinierten Namen).

**Um den Bericht zu öffnen:**
1. Doppelklicken Sie auf die CSV-Datei.
2. Verwenden Sie **Excel**, **Notepad** oder jede andere App, die CSV-Dateien öffnen kann.

--------------------------------------------------------------------------------

#### **Das wird Ihnen an diesem Skript gefallen**
✅ **Spart Zeit:** Automatisiert die manuelle Dateisuche.
✅ **Anpassbar:** Ändern Sie Verzeichnisse, Schlüsselwörter und Dateitypen.
✅ **Anfängerfreundlich:** Zur Verwendung sind keine Programmierkenntnisse erforderlich.

Viel Spaß beim Skripten! 🚀
