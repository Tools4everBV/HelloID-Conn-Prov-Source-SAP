Mithilfe des SAP Target & Source Connectors können Sie SAP über die Identity & Access Management (IAM)-Lösung HelloID von Tools4ever als Zielsystem mit Ihren Quellsystemen verknüpfen. Der Connector ermöglicht auch das Auslesen von SAP HCM als Quellsystem. Die Integration automatisiert Identity-Management-Prozesse und nimmt Ihnen viel Arbeit ab. In diesem Artikel gehen wir auf diesen Connector, seine Möglichkeiten und Vorteile ein.

## Was ist SAP?

SAP entwickelt Software zur Verwaltung von Geschäftsprozessen. Die Lösungen unterstützen die Datenverarbeitung und den Informationsfluss zwischen Organisationen. SAP bietet unter anderem Software für Enterprise Resource Planning (ERP), Supply Chain Management (SCP) und Customer Relationship Management (CRM) sowie Lösungen für das Finanzmanagement und Human Capital Management (HCM) an. Die Anwendungen sind in einer Suite integriert, die über eine Online-Plattform angeboten wird.

## Warum ist die Integration von SAP sinnvoll?

Kunden nutzen SAP häufig als zentrales System in ihrer Organisation. In vielen Fällen sind Geschäftsprozesse stark von SAP abhängig. SAP ist als Plattform in vielen verschiedenen Formen erhältlich. So ist SAP HCM ein HRM-System, das als Quellsystem dienen kann. Gleichzeitig ist SAP auch als ERP-, SCP- oder CRM-System verfügbar, mit dem HelloID als Zielsystem kommunizieren kann. Die Art der Verbindung von HelloID mit SAP hängt daher von der verwendeten SAP-Lösung ab.

Wer beispielsweise mit SAP als ERP-, SCP- oder CRM-System arbeiten möchte, benötigt hierfür ein Konto. Dank der Verbindung zwischen Ihrem Quellsystem und SAP über HelloID müssen Sie sich nicht mehr um deren Verwaltung kümmern. HelloID übernimmt den gesamten Prozess und nimmt Ihnen viel Komplexität ab. So müssen Sie keine Konten mehr manuell erstellen, vermeiden durch Automatisierung menschliche Fehler und kümmern sich nicht um die Verwaltung von Zugriffsrechten. Verändern sich Daten in Ihrem Quellsystem, erkennt HelloID dies automatisch und passt die SAP-Konten bei Bedarf an.

Nutzen Sie SAP HCM als Quellsystem, sorgt der SAP-Connector dafür, dass SAP HCM nahtlos in Ihre Zielsysteme integriert wird. In diesem Fall kann HelloID basierend auf den Daten aus SAP HCM die erforderlichen Konten in Ihren Zielsystemen erstellen und verwalten sowie das Management der Berechtigungen übernehmen.

Der SAP-Connector ermöglicht Integrationen mit vielen gängigen Systemen. Einige Beispiele sind:

* Active Directory
* Entra ID (vormals Azure AD)

Weiter unten im Artikel erfahren Sie mehr über diese Integrationen.

## Wie HelloID mit SAP integriert

SAP verbindet sich primär als Zielsystem mit HelloID. Der SAP-Connector ergänzt dabei in vielen Fällen die Active Directory und/oder Entra ID-Connector. Häufig verwendet der Connector dann auch Kontoangaben, die von einem anderen Ziel-Connector stammen. Der Connector ist jedoch auch als Quell-Connector einsetzbar, bei dem SAP HCM als Quellsystem mit Ihren Zielsystemen verbunden wird.

HelloID greift über den SAP-Connector auf die Business Application Programming Interfaces (BAPIs) und remote-fähigen Funktionsmodule innerhalb einer SAP-Lösung zu. Diese APIs und Module ermöglichen nicht nur die Verwaltung von Konten und Autorisierungen in z.B. SAP R/3 und R/4 HANA, sondern auch das Auslesen von Informationen aus SAP HCM.

**Benutzerkonten verwalten**
Die Verbindung ermöglicht HelloID unter anderem das Verwalten von Benutzerkonten in SAP. Die IAM-Lösung kann Konten erstellen und dabei beispielsweise den Benutzernamen, Vor- und Nachnamen, Adressdaten sowie Referenzbenutzer einstellen. Zudem kann HelloID spezifische Benutzerprofile SAP-Konten zuweisen. Ändern sich die Daten eines Benutzers in Ihrem Quellsystem, passt HelloID das dazugehörige SAP-Konto automatisch an. Verlasse ein Mitarbeiter das Unternehmen, kann HelloID das Benutzerkonto automatisch entfernen.

**Maßgeschneiderte Befehle ausführen**
HelloID kann über den SAP-Connector auch einen BAPI-Aufruf ausführen. Dies ermöglicht unter anderem die Durchführung maßgeschneiderter Befehle, die der Kunde selbst dem SAP-System hinzugefügt hat.

Für die Verbindung des SAP-Connectors mit der gewünschten SAP-Lösung ist die richtige Konfiguration notwendig. Die Konfiguration des Connectors erfolgt über den SAP Connector for Microsoft .NET. Diese Integrationsmöglichkeit sorgt dafür, dass der SAP-Connector sich wie ein SAP-Client verhält und so eine Verbindung mit einem SAP-System herstellen kann. Für die Konfiguration sind folgende Eigenschaften erforderlich: NAME, ASHOST, SYSID, SYSNR, CLIENT, USER und PASSWD.

## HelloID für SAP unterstützt Sie bei

* **Effizienterer Kontoerstellung:** HelloID erkennt Änderungen in Ihrem Quellsystem, wie das Anlegen eines neuen Benutzers, das Ändern von Daten oder das Ende des Arbeitsverhältnisses eines Mitarbeiters. Basierend darauf führt die IAM-Lösung automatisch die richtige Aktion aus. So kann HelloID ein SAP-Konto automatisch erstellen, Kontodaten ändern oder ein Konto löschen. Dies sorgt für ein effizienteres Benutzerkontenmanagement und dafür, dass neue Mitarbeiter sofort beginnen können.

* **Komplexität reduzieren:** Die Verbindung zwischen Ihren Quellsystemen und SAP-Systemen oder zwischen SAP HCM und Ihren Zielsystemen reduziert viel Komplexität. Das Arbeiten mit einzelnen Skripten ist nicht mehr erforderlich, und der SAP-Connector sorgt für eine einheitliche Vorgehensweise.

* **Fehlerfreies Kontenmanagement:** Menschliche Fehler beim Kontenmanagement gehören dank der Verbindung zwischen SAP und HelloID der Vergangenheit an. Die IAM-Lösung sorgt dafür, dass Konten immer die richtigen Rechte erhalten, sodass Mitarbeiter sofort produktiv sein können.

* **Kontenmanagement an das IDU-Prozess koppeln:** Das Management von Benutzerkonten ist dank der Verbindung zwischen SAP und HelloID stets an Ihr Einstiegs-, Durchlauf- und Ausstiegsprozess (IDU-Prozess) gekoppelt. Ändert sich die Position eines Mitarbeiters, passt HelloID die Zugriffsrechte automatisch an. Scheidet ein Mitarbeiter aus, entzieht HelloID automatisch die vergebenen Zugriffsrechte und löscht bei Bedarf Konten. So stellen Sie sicher, dass unautorisierte Benutzer nicht unerwartet Zugang zu Systemen behalten, und verbessern sowohl das Serviceniveau als auch die Sicherheit.

## Systeme mit SAP über HelloID verbinden

Über HelloID können Sie verschiedene Systeme mit SAP verbinden und so das Management von Benutzerkonten und Berechtigungen verbessern. Beispiele für häufige Integrationen sind:

* **Microsoft Active Directory - SAP Verbindung:** Die Microsoft Active Directory - SAP Verbindung ermöglicht es HelloID, Änderungen in Active Directory automatisch zu verarbeiten, wobei das Quellsystem immer führend ist. So kann HelloID einen neuen Benutzer erstellen, Zugriffsrechte ändern oder ein Konto löschen. So wird sichergestellt, dass SAP-Konten stets mit Active Directory übereinstimmen.

* **Microsoft Entra ID - SAP Verbindung:** Die Microsoft Entra ID - SAP Verbindung nimmt Ihnen viel Arbeit ab, indem sie dafür sorgt, dass Konten und Benutzerrechte in SAP aktuell gehalten werden. HelloID erkennt automatisch Änderungen in Entra ID und überträgt diese konsistent in SAP. So müssen Sie sich nicht um deren Verwaltung kümmern.

HelloID bietet Unterstützung für mehr als 200 Connectoren. Sie können die IAM-Lösung von Tools4ever an nahezu alle populären Quellen- und Zielsysteme anschließen. Interessiert an den von uns angebotenen Connectoren? <a href="https://www.tools4ever.nl/connectoren/">Sehen</a> Sie sich die vollständige Übersicht auf unserer Website an.