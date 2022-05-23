import sys
from pony.orm import *
from PyQt5.QtWidgets import QApplication, QDesktopWidget, QMessageBox, qApp, QAction, QMainWindow, QTextEdit, QInputDialog
from PyQt5.QtGui import QIcon
import traceback

db = Database()


class Widget(QMainWindow):

    def __init__(self):
        super().__init__()
        self.initUI()

    def center(self):
        qr = self.frameGeometry()
        cp = QDesktopWidget().availableGeometry().center()
        qr.moveCenter(cp)
        self.move(qr.topLeft())

    def closeEvent(self, event):
        reply = QMessageBox.question(self, 'Wyjście',
                                     "Czy chcesz opuścić aplikację?", QMessageBox.Yes |
                                     QMessageBox.No, QMessageBox.No)
        if reply == QMessageBox.Yes:
            event.accept()
        else:
            event.ignore()

    def initUI(self):
        exitAct = QAction('&Wyjdź z aplikacji', self)
        exitAct.setStatusTip('Wyjście z aplikacji')
        exitAct.triggered.connect(qApp.quit)

        connection = QAction('&Połącz z bazą danych', self)
        connection.setStatusTip('Łączy z bazą danych')
        connection.triggered.connect(self.db_connection)

        addPer = QAction('&Dodaj klienta',self)
        addPer.setStatusTip('Dodawanie klienta')
        addPer.triggered.connect(self.AddPer)

        delPer = QAction('&Usuń klienta',self)
        delPer.setStatusTip('Usuwanie klienta')
        delPer.triggered.connect(self.DelPer)

        priPer = QAction('&Wypisz osoby (cena)', self)
        priPer.setStatusTip('Wypisuje nazwiska i pesele osób, których cena biletu jest w danym przedziale')
        priPer.triggered.connect(self.PriPer)

        plaPer = QAction('&Wypisz osoby (miejsce)',self)
        plaPer.setStatusTip('Wypisuje imiona i nazwiska osób, które lecą do danego miejsca alfabetycznie względem nazwiska')
        plaPer.triggered.connect(self.PlaPer)

        QPlane = QAction('&Ilość samolotów',self)
        QPlane.setStatusTip('Sprawdź ile samolotów jest w bazie')
        QPlane.triggered.connect(self.qplanes)

        HPlane = QAction('&Samoloty na dworze',self)
        HPlane.setStatusTip('Wypisuje numer każdego samolotu, który stoi na dworze')
        HPlane.triggered.connect(self.hplane)

        pPlane = QAction('&Osoby w samolocie', self)
        pPlane.setStatusTip('Wypisuje ile osób, jest w konkretnym samolocie')
        pPlane.triggered.connect(self.perPlane)

        Crew = QAction('&Załogi', self)
        Crew.setStatusTip('Wypisuje wszystkie załogi danej linii lotniczej')
        Crew.triggered.connect(self.crews)

        Lines = QAction('&Linie lotnicze', self)
        Lines.setStatusTip('Wypisuje dostępne linie lotnicze')
        Lines.triggered.connect(self.flylines)

        Help = QAction('&Pomoc', self)
        Help.setStatusTip('Nie dostaniesz pomocy')

        Credits = QAction('&Autorstwo i odniesienia', self)
        Credits.setStatusTip('Wypisuje autorów i odniesienia')
        Credits.triggered.connect(self.autorzy)

        self.statusBar()
        menubar = self.menuBar()

        jMenu = menubar.addMenu('&Plik')
        jMenu.addAction(connection)
        jMenu.addAction(exitAct)

        dMenu = menubar.addMenu('&Samoloty')
        dMenu.addAction(QPlane)
        dMenu.addAction(HPlane)
        dMenu.addAction(pPlane)

        tMenu = menubar.addMenu('&Osoby')
        tMenu.addAction(addPer)
        tMenu.addAction(delPer)
        tMenu.addAction(priPer)
        tMenu.addAction(plaPer)

        cMenu = menubar.addMenu('&Załogi')
        cMenu.addAction(Crew)

        pMenu = menubar.addMenu('&Linie')
        pMenu.addAction(Lines)

        sMenu = menubar.addMenu(('&Pomoc'))
        sMenu.addAction(Help)
        sMenu.addAction(Credits)

        self.textEdit = QTextEdit()
        self.setCentralWidget(self.textEdit)

        self.setGeometry(500, 500, 500, 500)
        self.setWindowTitle('Baza Danych Samoloty')
        self.setWindowIcon(QIcon('samolot.gif'))
        self.center()
        self.show()

    def db_connection(self):
        try:
            db.bind(provider='postgres', user='postgres', password='fuel777', database='p01')
            QMessageBox.about(self,'Połączenie','Udało Ci się połączyć z bazą danych!')
        except:
            tb = traceback.format_exc()
            self.textEdit.insertPlainText(tb)

    def autorzy(self):
        self.textEdit.insertPlainText("Autorami tej aplikacji są: \n"
                                      "--- Karolina Hetnał --- \n"
                                      "--- Mateusz Szczepański ---\n\n"
                                      "Aplikacja stworzona w języku Python z wykorzystaniem biblioteki PyQt5 dzięki poradnikowi Jana Bodnara (ZetCode) "
                                      "oraz z wykorzystaniem biblioteki PonyORM do implementacji bazy danych w nurcie PostgreSQL."
                                      "\n\n")

    def flylines(self):
        try:
            with db_session:
                list_of_lines = db.select("* from linie_lotnicze;")
            for lines in list_of_lines:
                self.textEdit.insertPlainText(lines+"\n")
        except:
            QMessageBox.about(self,'Błąd','Błąd')

    def qplanes(self):
        try:
            with db_session:
                quantity_of_planes = db.select("count(*) FROM samoloty;")
            self.textEdit.insertPlainText(str(quantity_of_planes[0]))
        except:
            QMessageBox.about(self,'Błąd','Błąd')

    def hplane(self):
        try:
            with db_session:
                planes_on_air = db.select("id_samolotu FROM samoloty WHERE hangary=0;")
            for planes in planes_on_air:
                self.textEdit.insertPlainText(str(planes)+"\n")
        except:
            QMessageBox.about(self,'Błąd','Błąd')

    def perPlane(self):
        try:
            with db_session:
                people_in_planes = db.select("samoloty, count(*) as ilosc_osob_w_samolocie FROM klienci GROUP BY samoloty;")
            for pair in people_in_planes:
                self.textEdit.insertPlainText("W samolocie: "+str(pair[0])+" znajduje się "+str(pair[1])+" osób.\n")
        except:
            QMessageBox.about(self,'Błąd','Błąd')

    def AddPer(self):
        try:
            pesel, ok = QInputDialog.getText(self, 'Nowa Osoba',
                                           'Wprowadź pesel osoby:')
            imie, ok = QInputDialog.getText(self, 'Nowa Osoba',
                                             'Wprowadź imię osoby:')
            nazw, ok = QInputDialog.getText(self, 'Nowa Osoba',
                                             'Wprowadź nazwisko osoby:')
            bilet, ok = QInputDialog.getText(self, 'Nowa Osoba',
                                             'Wprowadź cenę biletu:')
            miejsce, ok = QInputDialog.getText(self, 'Nowa Osoba',
                                             'Wprowadź cel podróży:')
            klasa, ok = QInputDialog.getText(self, 'Nowa Osoba',
                                             'Wprowadź klasę lotu:')
            samol, ok = QInputDialog.getText(self, 'Nowa Osoba',
                                             'Wprowadź numer samolotu, którym dana osoba leci:')
            with db_session:
                db.execute("SELECT dodaj_osobe($pesel, $imie,$nazw,$bilet,$miejsce,$klasa,$samol);")
            QMessageBox.about(self, 'Powodzenie', 'Dodano osobę!')
        except:
            QMessageBox.about(self, 'Błąd', 'Błąd')

    def DelPer(self):
        try:
            pesel, ok = QInputDialog.getText(self, 'Nowa Osoba',
                                             'Wprowadź pesel osoby, którą chcesz usunąć:')
            with db_session:
                db.execute("SELECT usun_osobe($pesel);")
            QMessageBox.about(self, 'Powodzenie', 'Udało się usunąć')
        except:
            QMessageBox.about(self, 'Błąd', 'Błąd')

    def PriPer(self):
        try:
            dol, ok = QInputDialog.getText(self, 'Nowa Osoba',
                                             'Wprowadź dolny zakres cen:')
            gora, ok = QInputDialog.getText(self, 'Nowa Osoba',
                                            'Wprowadź górny zakres cen:')
            with db_session:
                listofpeople = db.select("nazwisko, pesel FROM klienci WHERE cena_biletu < $gora AND cena_biletu > $dol;")
            for people in listofpeople:
                self.textEdit.insertPlainText(str(people[0]) + " " + str(people[1]) + "\n")
        except:
            QMessageBox.about(self, 'Błąd', 'Błąd')

    def PlaPer(self):
        try:
            miejsce, ok = QInputDialog.getText(self, 'Nowa Osoba',
                                             'Wprowadź miejsce:')
            with db_session:
                listofpeople = db.select("imie, nazwisko FROM klienci WHERE miejsca = $miejsce ORDER BY nazwisko ASC;")
            for people in listofpeople:
                self.textEdit.insertPlainText(str(people[0])+" "+str(people[1])+"\n")
        except:
            QMessageBox.about(self, 'Błąd', 'Błąd')

    def crews(self):
        try:
            crew, ok = QInputDialog.getText(self, 'Załogi',
                                             'Wprowadź nazwę linii lotniczych:')
            with db_session:
                listofcrews = db.select("* FROM zalogi WHERE linie_lotnicze = $crew;")
            for crews in listofcrews:
                self.textEdit.insertPlainText(str(crews[0])+"\n")
        except:
            QMessageBox.about(self, 'Błąd', 'Błąd')

def main():
    app = QApplication(sys.argv)
    ex = Widget()
    sys.exit(app.exec_())

if __name__ == "__main__":
    main()






