#include <iostream>
#include <qglobal.h>
#include "Launcher.h"
#include <QList>


Launcher::Launcher(){  
    increment = 0;
};

Launcher::~Launcher(){
    qDebug() << "CLOSE LOOP";
};


void Launcher::launch(SodaClient::Event event){
    if(event.event_num == 1){  //evennement issu du timer
        MP input = mp_list[0];

        MP child_24 = input["children[2]"]["children[0].children"];
        MP node_22 = input["children[0]"]["children[1]"];
        QString name_0 = input["name"];

        if(name_0 == "+"){
            child_24 << node_22;
            name_0 = "Noeud 0";
            input["name"] = name_0;
        }
        else if(name_0 == "-"){
            child_24.clear();
            name_0 = "Noeud 0";
            input["name"] = name_0;
            input["children[2]"]["children[0].children"] = child_24;
        }

        qDebug() << child_24;


//        MP nom = input["children[0]"]["children[1]"]["children[0].children"];
//        QString _nom = nom;
//        _nom = "testotest";
//        nom = _nom;


        input.flush();
    }

    if(event.event_num != 1){  //evennement issu d'une modification de l'objet sur le serveur
        MP input = mp_list[0];
    }
};


