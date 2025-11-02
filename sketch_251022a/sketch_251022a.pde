/**
  SUPERVISED LEARNING:
  --------------------
  DATASET : Abbiamo un gruppo di dati che usiamo per trainare il nostro modello.
  GUESS   : La previsione del nostro modello sulla base di un input che può appartenere al dataset, o meno.

  ERROR   : ANSWER - GUESS = la stima dell'errore e' fondamentale per IMPARARE (learning)
  
  Come usiamo l'ERROR ?
  ---------------------
  
  Aggiustiamo i pesi all'interno del PERCEPTRON!
  W(next) = W(start) + W(Delta)  --- (Steering behaviour)
  
*/
// Dichiarazione variabili GLOBALI:

// DATASET:
int NUM_POINTS = 100;
Point[] points = new Point[NUM_POINTS];

// MODELLO:
int NUM_INPUTS = 3;
float LEARNING_RATE = 0.001;
Perceptron perceptron;

// Gli diamo 1 punto alla volta:
int trainingIndex = 0;

// Chiamato 1 volta sola per inizializzazione:
void setup() {
  size(800, 800);
  
  // Creiamo i punti:
  for(int i=0; i<points.length; i++) {
    points[i] = new Point();
  }
  // Creiamo il perceptrone:
  perceptron = new Perceptron(NUM_INPUTS, LEARNING_RATE);
}


// Chiamato 60 volte al secondo, per animazione:
void draw() {
  background(255);
  strokeWeight(1);
  // Disegnamo la linea di demarcazione:
  drawLine();
  drawPerceptronLine();
  
  // STAMPA PREVISIONI:
  strokeWeight(2);
  for (Point p : points) {
    // Disegno il punto:
    p.show();  
    
    float[] inputs = p.getInputs();
    float label = p.getLabel();  
    float prevision = perceptron.getPrevision(inputs);
    // Verifico se la mia previsione e' uguale alla classificazione:
    if ( prevision == label ) {
      // PREVISIONE OK !   [GREEN]
      fill(0, 255, 0);
    }
    else {
      // PREVISIONE SBAGLIATA !!!  [RED]
      fill(255, 0, 0);
    }
    // Disegno dentro il punto:
    noStroke();
    ellipse(p.getPixelX(), p.getPixelY(), 16, 16);
  }
  
  // TRANING (1 punto alla volta):
  Point dataset = points[trainingIndex];
  perceptron.doTraining(dataset.getInputs(), dataset.getLabel());
  // Evitiamo di uscire dall'array.
  trainingIndex++;
  if ( trainingIndex >= points.length ) {
    trainingIndex = 0;
  }
}


/** Disegnamo la linea. */
void drawLine() {
  stroke(0, 0, 255);
  strokeWeight(3);
  Point p1 = new Point(-1.0, function(-1.0));
  Point p2 = new Point(1.0, function(1.0));
  line(p1.getPixelX(), p1.getPixelY(), p2.getPixelX(), p2.getPixelY());
}


/** Disegno la linea del perceptrone. */
void drawPerceptronLine() {
  stroke(0);
  strokeWeight(3);
  Point pp1 = new Point(-1.0, perceptron.guessY(-1.0));
  Point pp2 = new Point( 1.0, perceptron.guessY( 1.0));
  line(pp1.getPixelX(), pp1.getPixelY(), pp2.getPixelX(), pp2.getPixelY());
}
