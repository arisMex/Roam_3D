class RangeeTables {
  float l;
  float L;
  float H;
  float e;
  int nbUC = 5;
  PImage texture;
  int nbTables;
  int nbRangees;
  int distanceEntreRangees;

  Cube cube;
  PShape plan;

  RangeeTables(int nbTab, int nbRan, float l, float L, float H, float e, PImage tex) {
    this.L = L;
    this.l = l;
    this.H = H;
    this.e = e;
    this.texture = tex;
    this.nbTables = nbTab;
    this.texture = tex;
    this.nbRangees = nbRan;
  }

  PShape getRangee() {
    PShape s = createShape(GROUP);
    PShape[] tables  =new PShape[nbTables];
    PShape[] uc  =new PShape[nbUC];
    PShape[] ecrans  =new PShape[nbUC];
    PShape[] claviers  =new PShape[nbUC];
    PShape[] souris  =new PShape[nbUC];
    PShape[] chaises  =new PShape[nbTables*2];



    for (int i = 0; i<nbTables; i++) {
      tables[i] = (new Table(l, L, H, e, texture)).getTable();
      tables[i].translate(i*L, 0, 0);
      s.addChild(tables[i]);
    }
    float a = (L- (2*40))/4;
    for (int i = 0; i<chaises.length; i++) {
      chaises[i] = (new Chaise(40, 44, 84, 2, textureChaise)).getChaise();
      chaises[i].translate( i*2*a + 2*a + i*40 - L/2, H-44, -44/2 - random(20, 25) );
      chaises[i].rotateY(random(-PI/40, PI/40));
      s.addChild(chaises[i]);
    }


    for (int i = 0; i<nbUC; i++) {
      uc[i] = (new UC(28, 9, 29, texUcFace, texUcDos, texUcFace)).getUC();
      claviers[i] = (new Clavier(44, 13, 2, texClavier, texClavier)).getClavier();
      ecrans[i]  = (new Ecran(53, 31, 60, 2, texUcFace, texUcDos, texUcCote)).getEcran();

      uc[i].translate(0, -29/2, l/5 );//hauteur + (H+29/2)
      claviers[i].translate(0, -2, -l/5 + random(-l/10, l/10));
      claviers[i].rotateY(random(-PI/20, PI/20));

      souris[i]  = (new Souris(10, 6, 2 )).getSouris();
      souris[i].translate(0, -6, -l/5 + random(-l/10, l/10));
      souris[i].rotateY(random(-PI/20, PI/20));

      ecrans[i].translate(0, -31+e, l/3 + random(-l/10, l/30));
      ecrans[i].rotateY(random(-PI/30, PI/30));
    }
    uc[0].translate(1.5*L + L/15, 0, 0);
    s.addChild(uc[0]);
    uc[1].translate(L/2 + L/15, 0, 0);
    s.addChild(uc[1]);
    uc[2].translate(L/2 - L/15, 0, 0);
    s.addChild(uc[2]);
    uc[3].translate(-L/ 2 +L/15, 0, 0);
    s.addChild(uc[3]);
    uc[4].translate(1.5*L - L/15, 0, 0);
    s.addChild(uc[4]);

    claviers[0].translate(L- 22 - L/10, 0, 0);
    s.addChild(claviers[0]);
    claviers[1].translate(2*L- 22 - L/10, 0, 0);
    s.addChild(claviers[1]);
    claviers[2].translate(- 22 - L/10, 0, 0);
    s.addChild(claviers[2]);
    claviers[3].translate( 22 + L/10, 0, 0);
    s.addChild(claviers[3]);
    claviers[4].translate(L+ 22 + L/10, 0, 0);
    s.addChild(claviers[4]);

    souris[0].translate(-L/4 - 22, 3, 0);
    s.addChild(souris[0]);
    souris[1].translate(3/2*L+10, 3, 0);
    s.addChild(souris[1]);
    souris[2].translate(L/2 +15, 3, 0);
    s.addChild(souris[2]);
    souris[3].translate( 0, 3, 0);
    s.addChild(souris[3]);
    souris[4].translate(2*L - L/2 + 15 , 3, 0);
    s.addChild(souris[4]);

    ecrans[0].translate(L- 22 - L/10, 0, 0);
    s.addChild(ecrans[0]);
    ecrans[1].translate(2*L- 22 - L/10, 0, 0);
    s.addChild(ecrans[1]);
    ecrans[2].translate(- 22 - L/10, 0, 0);
    s.addChild(ecrans[2]);
    ecrans[3].translate( 22 + L/10, 0, 0);
    s.addChild(ecrans[3]);
    ecrans[4].translate(L+ 22 + L/10, 0, 0);
    s.addChild(ecrans[4]);


    return s;
  }

  PShape getRangees() {
    PShape s = createShape(GROUP);
    PShape[] rangee  =new PShape[nbRangees];

    for (int i = 0; i<nbRangees; i++) {
      rangee[i] = getRangee();
      rangee[i].translate(0, 0, i*2*l);
      s.addChild(rangee[i]);
    }

    return s;
  }
}
