# StayFit

Bc. Vít Nademlejnský 
21.3.2024

## Úvod
Cílem tohoto dokumentu je detailněji popsat aplikaci StayFit včetně LoFi prototypů a všech možných případů užití s jejich scénáři, která bude vyvíjena pro operační systém iOS 17.
Popis aplikace
Aplikace je určená pro plánování tréninkových aktivit a zaznamenávání si jich do kalendáře pod svým vlastním účtem. Ke každému proběhlému tréninku aplikace také umožňoje zachycení tréninku pomocí fotoaparátu mobilního zařízení. V průběhu používání budou vytvářeny statistiky popisující počty odcvičených dní a vyzdvihující nejčastější typ cvičení. V aplikaci také budou nabízena různá doporučení na fitness eshopy nebo na stránky či sociální sítě ověřených fitness influencerů, kde budou uživateli moci najít inspiraci.

## Existující řešení
### 3.1 Kondice
Jedna z aplikací, která je rozhodně inspirací pro aplikaci StayFit je aplikace od Applu Kondice, kterou uživatel iOS získá se zakoupením a párováním Apple Watch zařízení.
Aplikace také nabízí hezký přehled proběhlých cvičení a detaily cvičení s šikovným použití jednoduchých obrázků cvičení, které dávají uživateli dobrý přehled nad jeho proběhlými cvičeními.

### 3.2 Nike Training Club
Další inspirací se stala aplikace od Nike se jménem Nike Training Club, která má velmi dechberoucí minimalistický design a dobré řešení nabídky tréninků a doporučení pro uživatele.

Aplikace StayFit bude navržena tak, aby nemusela využívat žádné další externí zařízení pro správnou funkčnost a použitelnost a zároveň kombinovala to nejlepší z obou výše zmíněných aplikací pro fitness.

## Speciální požadavky
### Data
Aplikace bude připojená na Firebase databázi a uživatel se bude přihlašovat a registrovat přes FirebaseAuthentication.
### Senzory
Aplikace bude mít přístup k fotoaparátu a bude moci s jeho pomocí vkládat fotky do aplikace.
### UI
Notifikace na daný den, pokud má uživatel zaplé notifikace na cvičení.

## Cíloví uživatelé
Cílovými uživateli pro aplikaci StayFit jsou uživtaté, kteří se už delší dobu věnují cvičení a aktivnímu životnímu stylu nebo s tím chtějí teprve začít. Aplikace je vhodná i pro nováčky v oboru, jelikož její použití je velmi intuitivní i pro neznalce v oblasti fitness.

## Případy užití aplikace
Níže jsou popsány případy užití aplikace i s jejich příslušnými scénáři, které může uživatel při průchodu aplikace využít.
### 5.1  UC-1 Zobrazení listu tréninků
Uživatel klikne na hlavním menu aplikace v dolním navigačním baru na položku “Menu”
Aplikace zobrazí uživateli přehled proběhlých, dnešních a budoucích tréninků
### 5.2  UC-2 Zobrazení statistik
Uživatel klikne na hlavním menu aplikace v dolním navigačním baru na položku “Statistics”
Aplikace zobrazí uživateli statistiky jeho tréninků
### 5.3  UC-3 Zobrazení účtu a nastavení
Uživatel klikne na hlavním menu aplikace v dolním navigačním baru na položku “User”
Aplikace zobrazí uživateli možnosti jeho účtu a nastavení
### 5.4  UC-4 Registrace do aplikace
Uživatel klikne při prvním spuštění aplikace na tlačítko “Registration”
Uživatel zadá platný e-mail a heslo
Uživatel bude zaregistrován a přesunut do hlavního menu aplikace 
### 5.5  UC-5 Přihlášení se do aplikace
Uživatel zadá při spuštění aplikace svůj e-mail a heslo
IF uživatel zadal správný e-mail a heslo
THEN uživatel bude přesunut do hlavního menu aplikace
ELSE aplikace ukáže varovný Alert s informacemi o špatnými vstupními údaji
### 5.6  UC-6 Změna hesla
Uživatel v sekci “User” zadá do textového pole nové heslo
Uživatel klikne na tlačítko “Change password”
Aplikace změní uživateli heslo
### 5.7  UC-7 Vytvoření nového tréninku
Uživatel v sekci “Menu” klikne na tlačítko s ikonou “+”
Aplikace přesune uživatele na tvorbu tréninku
Uživatel zadá následující informace:
Typ tréninku
Místo tréninku
Popis (Volitelně)
Datum tréninku
Uživatel bude moci nastavit, jestli má dostat notifikaci na trénink v daný den či ne pomocí přepínacího tlačítka
### 5.8  UC-8 Filtrování tréninků na základě typu
Uživatel v sekci “Menu” klikne na rozevírací seznam s nápisem “Type”
Uživatel vybere konkrétní typ tréninku
### 5.9  UC-9 Filtrování tréninků na základě data
Uživatel v sekci “Menu” klikne na rozevírací seznam s nápisem “Date”
Uživatel vybere konkrétní datum tréninku
### 5.10  UC-10 Filtrování statistik na základě měsíce
Uživatel v sekci “Statistics” klikne na rozevírací seznam s nápisem “Date”
Uživatel vybere konkrétní datum tréninku
### 5.11  UC-11 Zobrazení konkrétního tréninku
Uživatel v sekci “Menu” klikne na konkrétní trénink
Aplikace zobrazí detail tréninku se všemi informacemi ke konkrétnímu tréninku
### 5.12  UC-12 Pořízení fotografie ke konkrétnímu tréninku
Uživatel na detailu tréninku klikne na ikonu fotoaparátu
Aplikace zobrazí uživateli obrazovku s možností pořízení fotografie
Uživatel klikne na bílý kruh a pořídí fotografii
IF uživatel klikne na tlačítko “Use” THEN aplikace přesune uživatele na detail aplikace s obsaženou fotografií
IF uživatel klikne na tlačítko “New” THEN bod 2.
### 5.13 UC-13 Úprava tréninku
Uživatel na detailu tréninku klikne na tlačítko “Edit”
Aplikace zobrazí obrazovku “Edit Training” s již dosud vyplněnými údaji
### 5.14 UC-14 Smazání tréninku
Uživatel na obrazovce “Tvorba tréninku” klikne na tlačítko “Delete”
Aplikace smaže trénink a přesune uživatele na obrazovku “Menu”
### 5.15  UC-15 Odhlášení
Uživatel v sekci “User” klikne na tlačítko “Log out”
Aplikace přesune uživatele na obrazovku Přihlášení.

