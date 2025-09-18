# 👋 Willkommen zum Code Jam 2025 – #TeneriffaEdition

Hier dreht sich alles um gemeinsames Coden, Lernen und Ausprobieren in entspannter Atmosphäre – mit einer Prise Sonne und Meeresrauschen.

---

## 🚀 Was erwartet dich?

- **Praktische Aufgaben** rund um SAP und die BTP
- **Zusammenarbeit in kleinen Teams**
- **Jede Menge Spaß**, neue Erkenntnisse und Know-How aufbaut (technische und methodisch)

---

**Hier findest du alle Unterlagen, Beispiel-Requests, Profile und Ressourcen, die du für den Start brauchst.**  
Mach dich bereit, tauch ein in neue Technologien und lass uns gemeinsam besser werden – nicht nur im Code!

> _Let’s jam, collaborate and learn. It’s not about being perfect, it’s about getting better!_

Wenn du Fragen hast oder Support brauchst, besprich es mit deinem Team 😊 oder frag gern auch andere.

**Viel Spaß & happy coding!**  
_Euer Code Jam Orga-Team_

---

# 💻 Use-Case und User Story

**User Story: Übermittlung und Freigabe von Lastgängen aus dem Energiehandel**

> _Als Sachbearbeiter im Energiehandel möchte ich, dass übermittelte Lastgänge gemäß Vorgabe per API zuverlässig und sicher in unsere Systemlandschaft übertragen werden, so dass diese Profile im Backend immer persistiert werden, ein transparenter Freigabeprozess sichergestellt ist und der Status der Profile jederzeit eingesehen werden kann._

**Akzeptanzkriterien**

- **Integration und Übermittlung**
  - Profile werden über einen definierten POST-Request an das System gesendet.
  - Die Übermittlung erfolgt ausschließlich über den bestehenden Integration-Layer.
- **Persistenz im Backend**
  - Alle empfangenen Profile werden im Backend in einem RAP-Datenmodell gespeichert.
  - Im Profilkopf wird ein zusätzlicher Status geführt, der anzeigt, ob das Profil sich noch im Freigabeprozess befindet.
- **Freigabeprozess bei hoher Energiemenge**
  - Wird im Profil eine Energiemenge von mehr als 1 GWh über den gesamten Zeitraum erreicht, muss eine Freigabe erfolgen.
  - Für diesen Fall wird den Mitarbeitenden ein Formular zur Verfügung gestellt, das alle relevanten Informationen zum Profilkopf enthält.
- **Entscheidung und Rückmeldung**
  - Die Entscheidung (genehmigt oder nicht genehmigt) wird direkt aus dem Formular an das Backend zurückgegeben und dort verarbeitet.
- **Trennung der Schichten**
  - Im API-/Integration-Layer findet keine Business-Logik statt.
  - Sämtliche geschäftsrelevanten Prüfungen und Prozesse sind ausschließlich im Backend implementiert, um eine zentrale Nutzung der Logik zu gewährleisten.
- **Transparenz für Trading-KollegInnen**
  - Für die KollegInnen im Trading wird eine App bereitgestellt, in der der aktuelle Status jedes Profils eingesehen werden kann.
- **Statusschema für das Backend**
  - In Freigabe
  - Freigegeben
  - Abgelehnt
  - Fehlerhaft


**Akzeptanztest**
- Ein übermitteltes Profil mit einer Energiemenge > 1 GWh wird im Backend gespeichert, erhält den Status "In Freigabe", und der zuständige Mitarbeiter kann über ein bereitgestelltes Formular die Freigabe erteilen oder ablehnen. Die getroffene Entscheidung wird im Backend gespeichert und der Status des Profils entsprechend aktualisiert. In der Trading-App ist der aktuelle Status jederzeit einsehbar.

- Ein übermitteltes Profil mit einer Energiemenge ≤ 1 GWh wird im Backend gespeichert, erhält direkt den Status „Freigegeben“ und kann ohne Freigabeprozess direkt weiterverarbeitet werden. Der aktuelle Status ist in der Trading-App jederzeit einsehbar.


Konkrete Einbettung in einen Business-Kontext.
<img width="1210" alt="image" src="https://github.com/user-attachments/assets/ffaf189e-5d1b-49e8-b8c1-f3fe3180af44" />

Alle weitere Infos und Dokumente, hier im Repo!
