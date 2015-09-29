#include <iostream>
#include <qglobal.h>
#include "Launcher.h"


Launcher::Launcher(){
    increment = 0;
};

Launcher::~Launcher(){
    qDebug() << "CLOSE LOOP";
};


void Launcher::launch(SodaClient::Event event){
    if(event.event_num == 1){  // événement issu du timer

        MP input = mp_list[0];
        QString text(input["txt"]);
        text += "!";
        input["txt"] = text;
        qDebug() << input["txt"];

        input.flush();
    }

    if(event.event_num != 1){  // événement issu d'une modification de l'objet sur le serveur

    }
};


